using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;


namespace L1
{
    public partial class Form1 : Form
    {
        SqlConnection sqlConnection;
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        DataSet parentDataSet = new DataSet();
        DataSet childDataSet = new DataSet();

        Dictionary<string, SqlDbType> typeMap = new Dictionary<string, SqlDbType>();

        string connectionString;
        string parentTableName;
        string[] parentTableIDNames;


        string childTableName;
        string[] childTableFillableFields;
        string[] childTableIDNames;
        string[] childTableIDTypes;
        string[] childTableParentIDNames;
        string[] childTableParentIDTypes;
        string[] childTableInsertionNames;
        string[] childTableInsertionParentNames;
        string[] childTableInsertionTypes;
        string[] childTableUpdateNames;
        string[] childTableUpdateTypes;

        private void initialize()
        {
            connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            parentTableName = ConfigurationManager.AppSettings["parentTableName"];
            parentTableIDNames = ConfigurationManager.AppSettings["parentTableIDNames"].Split(',');


            childTableName = ConfigurationManager.AppSettings["childTableName"];
            childTableFillableFields = ConfigurationManager.AppSettings["childTableFillableFields"].Split(',');
            childTableIDNames = ConfigurationManager.AppSettings["childTableIDNames"].Split(',');
            childTableIDTypes = ConfigurationManager.AppSettings["childTableIDTypes"].Split(',');
            childTableParentIDNames = ConfigurationManager.AppSettings["childTableParentIDNames"].Split(',');
            childTableParentIDTypes = ConfigurationManager.AppSettings["childTableParentIDTypes"].Split(',');
            childTableInsertionNames = ConfigurationManager.AppSettings["childTableInsertionNames"].Split(',');
            childTableInsertionParentNames= ConfigurationManager.AppSettings["childTableInsertionParentNames"].Split(',');
            childTableInsertionTypes = ConfigurationManager.AppSettings["childTableInsertionTypes"].Split(',');
            childTableUpdateNames = ConfigurationManager.AppSettings["childTableUpdateNames"].Split(',');
            childTableUpdateTypes = ConfigurationManager.AppSettings["childTableUpdateTypes"].Split(',');

        }
        public Form1()
        {
            initialize();
            sqlConnection = new SqlConnection(connectionString);
            typeMap.Add("1", SqlDbType.Int);
            typeMap.Add("2", SqlDbType.VarChar);
            InitializeComponent();
        }

        private string getParentSelect()
        {
            return "Select * from " + parentTableName;
        }
        private void fillParentSelect()
        {
        }
        private string getChildSelect()
        {
            string command = "Select * from " + childTableName + " where ";
            int i = 0;
            while (i < childTableParentIDNames.Length - 1)
            {
                command += childTableParentIDNames[i] + "=@a" + i.ToString() + " and ";
                i++;
            }
            command += childTableParentIDNames[i] + "=@a" + i.ToString();
            return command;
        }
        private void fillChildSelect()
        {
            for(int i = 0; i < childTableParentIDNames.Length; i++)
            {
                SqlDbType sqlDbType = typeMap[childTableParentIDTypes[i]];
                string parentFieldName =parentTableIDNames[i];
                dataAdapter.SelectCommand.Parameters.Add("@a"+i.ToString(), sqlDbType).Value = parentDataSet.Tables[0].Rows[parentDataGridView.SelectedRows[0].Index][parentFieldName];
            }
        }

        private string getChildAdd()
        {
            string command = "Insert into " + childTableName + "(";
            int i = 0;
            string attributes = "";
            while (i < childTableInsertionNames.Length)
            {
                attributes += childTableInsertionNames[i];
                i++;
                if (i != childTableInsertionNames.Length)
                    attributes += ",";
            }
            command += attributes;
            command += ") values(";
            i = 0;
            attributes = "";
            while (i < childTableInsertionNames.Length)
            {
                attributes +=  "@a" + i.ToString();
                i++;
                if (i != childTableInsertionNames.Length)
                    attributes += ",";
            }
            command += attributes;
            command += ")";
            return command;
        }
        private void fillChildAdd()
        {
            for (int i = 0; i < childTableInsertionNames.Length; i++)
            {
                SqlDbType sqlDbType = typeMap[childTableInsertionTypes[i]];
                string fieldName = childTableInsertionNames[i];
                if (!childTableFillableFields.Contains(fieldName))
                {
                    fieldName = childTableInsertionParentNames[i];
                    dataAdapter.InsertCommand.Parameters.Add("@a" + i.ToString(), sqlDbType).Value = parentDataSet.Tables[0].Rows[parentDataGridView.SelectedRows[0].Index][fieldName];
                }
                else
                {
                    string valueString = "";
                    foreach(var textBox in textBoxes)
                    {
                        if (textBox.Name.Equals(fieldName + "TextBox"))
                        {
                            valueString = textBox.Text;
                            break;
                        }
                    }
                    if (sqlDbType.Equals(SqlDbType.Int))
                    {
                        int value = Int32.Parse(valueString);
                        dataAdapter.InsertCommand.Parameters.Add("@a" + i.ToString(), sqlDbType).Value = value;
                    }
                    else
                    {
                        dataAdapter.InsertCommand.Parameters.Add("@a" + i.ToString(), sqlDbType).Value = valueString;
                    }
                }
            }
        }

        private string getChildUpdate()
        {
            string command = "Update " + childTableName + " set ";
            int i = 0;
            string attributes = "";
            while (i < childTableUpdateNames.Length)
            {
                attributes += childTableUpdateNames[i];
                attributes += "=@a" + i.ToString();
                i++;
                if (i != childTableUpdateNames.Length)
                    attributes += ",";
            }
            command += attributes;
            command += " where ";
            int j = 0;
            attributes = "";
            while (j < childTableIDNames.Length)
            {
                attributes+=childTableIDNames[j]+"=";
                attributes += "@a" + (i+j).ToString();
                j++;
                if (j != childTableIDNames.Length)
                    attributes += " and ";
            }
            command += attributes;
            return command;
        }
        private void fillChildUpdate()
        {
            int i = 0;
            for (; i < childTableUpdateNames.Length; i++)
            {
                SqlDbType sqlDbType = typeMap[childTableUpdateTypes[i]];
                string fieldName = childTableUpdateNames[i];
                string valueString = "";
                foreach (var textBox in textBoxes)
                {
                    if (textBox.Name.Equals(fieldName + "TextBox"))
                    {
                        valueString = textBox.Text;
                        break;
                    }
                }
                if (sqlDbType.Equals(SqlDbType.Int))
                {
                    int value = Int32.Parse(valueString);
                    dataAdapter.UpdateCommand.Parameters.Add("@a" + i.ToString(), sqlDbType).Value = value;
                }
                else
                {
                    dataAdapter.UpdateCommand.Parameters.Add("@a" + i.ToString(), sqlDbType).Value = valueString;
                }
            }
            for (int j = 0; j < childTableIDNames.Length; j++)
            {
                SqlDbType sqlDbType = typeMap[childTableIDTypes[j]];
                string fieldName = childTableIDNames[j];
                dataAdapter.UpdateCommand.Parameters.Add("@a" + (i+j).ToString(), sqlDbType).Value = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index][fieldName];
            }
        }
        private string getChildDelete()
        {
            string command = "Delete from " + childTableName + " where ";
            int i = 0;
            while (i < childTableIDNames.Length - 1)
            {
                command += childTableIDNames[i] + "=@a" + i.ToString() + " and ";
                i++;
            }
            command += childTableIDNames[i] + "=@a" + i.ToString();
            return command;
        }
        private void fillChildDelete()
        {
            for (int i = 0; i < childTableIDNames.Length; i++)
            {
                SqlDbType sqlDbType = typeMap[childTableIDTypes[i]];
                string fieldName = childTableIDNames[i];
                dataAdapter.DeleteCommand.Parameters.Add("@a" + i.ToString(), sqlDbType).Value = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index][fieldName];
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            refreshParent();
            refreshChild();
        }
        private void refreshParent()
        {
            dataAdapter.SelectCommand = new SqlCommand(getParentSelect(), sqlConnection);
            fillParentSelect();
            parentDataSet.Clear();
            dataAdapter.Fill(parentDataSet);
            parentDataGridView.DataSource = parentDataSet.Tables[0];
            refreshChild();
        }
        private void refreshChild()
        {
            if (parentDataGridView.SelectedRows.Count > 0)
            {
                dataAdapter.SelectCommand = new SqlCommand(getChildSelect(), sqlConnection);
                fillChildSelect();
                childDataSet.Clear();
                dataAdapter.Fill(childDataSet);
                childDataGridView.DataSource = childDataSet.Tables[0];
            }
        }
        private void refreshButton_Click(object sender, EventArgs e)
        {
            refreshParent();
        }

        private void parentDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            refreshChild();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (parentDataGridView.SelectedRows.Count > 0)
                {
                    dataAdapter.InsertCommand = new SqlCommand(getChildAdd(), sqlConnection);
                    fillChildAdd();
                    sqlConnection.Open();
                    int noUpdated = 0;
                    noUpdated = dataAdapter.InsertCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                    if (noUpdated > 0)
                    {
                        MessageBox.Show("Insert Succesful!");
                    }
                    else
                    {
                        MessageBox.Show("Insert Failed!");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                sqlConnection.Close();
            }
            refreshChild();
        }
        private void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (childDataGridView.SelectedRows.Count > 0)
                {
                    dataAdapter.UpdateCommand = new SqlCommand(getChildUpdate(), sqlConnection);
                    fillChildUpdate();
                    sqlConnection.Open();
                    int noUpdated = 0;
                    noUpdated = dataAdapter.UpdateCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                    if (noUpdated > 0)
                    {
                        MessageBox.Show("Update Succesful!");
                    }
                    else
                    {
                        MessageBox.Show("Update Failed!");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                sqlConnection.Close();
            }
            refreshChild();
        }
        private void deleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (childDataGridView.SelectedRows.Count > 0)
                {
                    dataAdapter.DeleteCommand = new SqlCommand(getChildDelete(), sqlConnection);
                    fillChildDelete();
                    sqlConnection.Open();
                    int noDeleted = 0;
                    noDeleted = dataAdapter.DeleteCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                    if (noDeleted > 0)
                    {
                        MessageBox.Show("Deletion Succesful!");
                    }
                    else
                    {
                        MessageBox.Show("Deletion Failed!");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                sqlConnection.Close();
            }
            refreshChild();
        }
    }
}
