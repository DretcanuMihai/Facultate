using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PracticSGBD
{
    public partial class Form1 : Form
    {
        SqlConnection sqlConnection = new SqlConnection("Data Source = DESKTOP-RP3BIR1\\SQLEXPRESS; Initial " +
        "Catalog = S1; Integrated Security = True");
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        DataSet parentDataSet = new DataSet();
        DataSet childDataSet = new DataSet();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            refreshParent();
            refreshChild();
        }
        private void refreshParent()
        {
            dataAdapter.SelectCommand = new SqlCommand("Select * from Muzee", sqlConnection);
            parentDataSet.Clear();
            dataAdapter.Fill(parentDataSet);
            parentDataGridView.DataSource = parentDataSet.Tables[0];
            refreshChild();
        }
        private void refreshChild()
        {
            if (parentDataGridView.SelectedRows.Count > 0)
            {
                dataAdapter.SelectCommand = new SqlCommand("Select * from Angajati where Mid=@id", sqlConnection);
                dataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = parentDataSet.Tables[0].Rows[parentDataGridView.SelectedRows[0].Index][0];
                childDataSet.Clear();
                dataAdapter.Fill(childDataSet);
                childDataGridView.DataSource = childDataSet.Tables[0];
            }
        }
        private void refreshButton_Click(object sender, EventArgs e)
        {
            refreshParent();
        }

        private void artistDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            refreshChild();
        }

        private void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (childDataGridView.SelectedRows.Count > 0)
                {
                    dataAdapter.UpdateCommand = new SqlCommand("Update Angajati set Nume=@a1,Prenume=@a2,Varsta=@a3,Experienta=@a4 where Aid=@id", sqlConnection);
                    dataAdapter.UpdateCommand.Parameters.Add("@a1", SqlDbType.VarChar).Value = textBox1.Text;
                    dataAdapter.UpdateCommand.Parameters.Add("@a2", SqlDbType.VarChar).Value = textBox2.Text;
                    dataAdapter.UpdateCommand.Parameters.Add("@a3", SqlDbType.Int).Value = Int32.Parse(textBox3.Text);
                    dataAdapter.UpdateCommand.Parameters.Add("@a4", SqlDbType.Int).Value = Int32.Parse(textBox4.Text);
                    dataAdapter.UpdateCommand.Parameters.Add("@id", SqlDbType.Int).Value = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index][0];
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
                    dataAdapter.DeleteCommand = new SqlCommand("Delete from Angajati where Aid=@id", sqlConnection);
                    dataAdapter.DeleteCommand.Parameters.Add("@id", SqlDbType.Int).Value = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index][0];
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

        private void addButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (parentDataGridView.SelectedRows.Count > 0)
                {
                    dataAdapter.InsertCommand = new SqlCommand("Insert into Angajati(Nume,Prenume,Varsta,Experienta,Mid) values(@a1,@a2,@a3,@a4,@id)", sqlConnection);
                    dataAdapter.InsertCommand.Parameters.Add("@a1", SqlDbType.VarChar).Value = textBox1.Text;
                    dataAdapter.InsertCommand.Parameters.Add("@a2", SqlDbType.VarChar).Value = textBox2.Text;
                    dataAdapter.InsertCommand.Parameters.Add("@a3", SqlDbType.Int).Value = Int32.Parse(textBox3.Text);
                    dataAdapter.InsertCommand.Parameters.Add("@a4", SqlDbType.Int).Value = Int32.Parse(textBox4.Text);
                    dataAdapter.InsertCommand.Parameters.Add("@id", SqlDbType.Int).Value = parentDataSet.Tables[0].Rows[parentDataGridView.SelectedRows[0].Index][0];
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

        private void onChildCellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (childDataGridView.SelectedRows.Count > 0)
            {
                textBox1.Text = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index]["Nume"].ToString();
                textBox2.Text = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index]["Prenume"].ToString();
                textBox3.Text = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index]["Varsta"].ToString();
                textBox4.Text = childDataSet.Tables[0].Rows[childDataGridView.SelectedRows[0].Index]["Experienta"].ToString();
            }
        }
    }
}
