using System.Collections.Generic;

namespace L1
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.parentDataGridView = new System.Windows.Forms.DataGridView();
            this.childDataGridView = new System.Windows.Forms.DataGridView();
            this.labels = new List<System.Windows.Forms.Label>();
            this.addButton = new System.Windows.Forms.Button();
            this.refreshButton = new System.Windows.Forms.Button();
            this.updateButton = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.parentDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.childDataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // parentDataGridView
            // 
            this.parentDataGridView.AllowUserToAddRows = false;
            this.parentDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.parentDataGridView.Location = new System.Drawing.Point(19, 19);
            this.parentDataGridView.MultiSelect = false;
            this.parentDataGridView.Name = "parentDataGridView";
            this.parentDataGridView.ReadOnly = true;
            this.parentDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.parentDataGridView.Size = new System.Drawing.Size(323, 275);
            this.parentDataGridView.TabIndex = 0;
            this.parentDataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.parentDataGridView_CellClick);
            // 
            // childDataGridView
            // 
            this.childDataGridView.AllowUserToAddRows = false;
            this.childDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.childDataGridView.Location = new System.Drawing.Point(400, 19);
            this.childDataGridView.MultiSelect = false;
            this.childDataGridView.Name = "childDataGridView";
            this.childDataGridView.ReadOnly = true;
            this.childDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.childDataGridView.Size = new System.Drawing.Size(361, 275);
            this.childDataGridView.TabIndex = 1;
            string[] strings = { };

            // 
            // addButton
            // 
            this.addButton.Location = new System.Drawing.Point(19, 319);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(75, 23);
            this.addButton.TabIndex = 2;
            this.addButton.Text = "Add";
            this.addButton.UseVisualStyleBackColor = true;
            this.addButton.Click += new System.EventHandler(this.addButton_Click);


            // 
            // refreshButton
            // 
            this.refreshButton.Location = new System.Drawing.Point(19, 349);
            this.refreshButton.Name = "refreshButton";
            this.refreshButton.Size = new System.Drawing.Size(75, 23);
            this.refreshButton.TabIndex = 3;
            this.refreshButton.Text = "Refresh";
            this.refreshButton.UseVisualStyleBackColor = true;
            this.refreshButton.Click += new System.EventHandler(this.refreshButton_Click);

            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(19, 379);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(75, 23);
            this.updateButton.TabIndex = 4;
            this.updateButton.Text = "Update";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.updateButton_Click);
            // 
            // deleteButton
            // 
            this.deleteButton.Location = new System.Drawing.Point(19, 409);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(75, 23);
            this.deleteButton.TabIndex = 5;
            this.deleteButton.Text = "Delete";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.deleteButton_Click);

            int index = 6;
            //
            // labels
            //
            int current = 0;
            foreach (var label in childTableFillableFields){
                System.Windows.Forms.Label newLabel=new System.Windows.Forms.Label();
                newLabel.AutoSize = true;
                newLabel.Location = new System.Drawing.Point(400, 319+current*26);
                newLabel.Name = label+"Label";
                newLabel.Size = new System.Drawing.Size(40, 13);
                newLabel.TabIndex = index;
                newLabel.Text = label+":";
                this.labels.Add(newLabel);
                index++;
                current++;
            }

            //
            // textBoxes
            //

            this.textBoxes = new List<System.Windows.Forms.TextBox>();
            current = 0;
            foreach (var label in childTableFillableFields)
            {
                System.Windows.Forms.TextBox newTextBox = new System.Windows.Forms.TextBox();
                newTextBox.Location = new System.Drawing.Point(500, 319 + 26*current);
                newTextBox.Name = label+"TextBox";
                newTextBox.Size = new System.Drawing.Size(100, 20);
                newTextBox.TabIndex = index;
                this.textBoxes.Add(newTextBox);
                index++;
                current++;
            }



            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 800);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.refreshButton);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.updateButton);
            foreach(var label in labels){
                this.Controls.Add(label);
            }
            foreach (var textBox in textBoxes)
            {
                this.Controls.Add(textBox);
            }
            this.Controls.Add(this.childDataGridView);
            this.Controls.Add(this.parentDataGridView);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.parentDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.childDataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView parentDataGridView;
        private System.Windows.Forms.DataGridView childDataGridView;
        private List<System.Windows.Forms.Label> labels;
        private List<System.Windows.Forms.TextBox> textBoxes;
        private System.Windows.Forms.Button addButton;
        private System.Windows.Forms.Button refreshButton;
        private System.Windows.Forms.Button updateButton;
        private System.Windows.Forms.Button deleteButton;
    }
}

