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
            this.artistDataGridView = new System.Windows.Forms.DataGridView();
            this.songDataGridView = new System.Windows.Forms.DataGridView();
            this.labelSong = new System.Windows.Forms.Label();
            this.nameLabel = new System.Windows.Forms.Label();
            this.minutesLabel = new System.Windows.Forms.Label();
            this.genreLabel = new System.Windows.Forms.Label();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.minutesTextBox = new System.Windows.Forms.TextBox();
            this.genreTextBox = new System.Windows.Forms.TextBox();
            this.updateButton = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            this.refreshButton = new System.Windows.Forms.Button();
            this.addButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.artistDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.songDataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // artistDataGridView
            // 
            this.artistDataGridView.AllowUserToAddRows = false;
            this.artistDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.artistDataGridView.Location = new System.Drawing.Point(19, 124);
            this.artistDataGridView.MultiSelect = false;
            this.artistDataGridView.Name = "artistDataGridView";
            this.artistDataGridView.ReadOnly = true;
            this.artistDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.artistDataGridView.Size = new System.Drawing.Size(323, 275);
            this.artistDataGridView.TabIndex = 0;
            this.artistDataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.artistDataGridView_CellClick);
            // 
            // songDataGridView
            // 
            this.songDataGridView.AllowUserToAddRows = false;
            this.songDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.songDataGridView.Location = new System.Drawing.Point(368, 124);
            this.songDataGridView.MultiSelect = false;
            this.songDataGridView.Name = "songDataGridView";
            this.songDataGridView.ReadOnly = true;
            this.songDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.songDataGridView.Size = new System.Drawing.Size(361, 275);
            this.songDataGridView.TabIndex = 1;
            // 
            // labelSong
            // 
            this.labelSong.AutoSize = true;
            this.labelSong.Location = new System.Drawing.Point(365, 9);
            this.labelSong.Name = "labelSong";
            this.labelSong.Size = new System.Drawing.Size(90, 13);
            this.labelSong.TabIndex = 2;
            this.labelSong.Text = "Song Information:";
            // 
            // nameLabel
            // 
            this.nameLabel.AutoSize = true;
            this.nameLabel.Location = new System.Drawing.Point(365, 39);
            this.nameLabel.Name = "nameLabel";
            this.nameLabel.Size = new System.Drawing.Size(38, 13);
            this.nameLabel.TabIndex = 3;
            this.nameLabel.Text = "Name:";
            // 
            // minutesLabel
            // 
            this.minutesLabel.AutoSize = true;
            this.minutesLabel.Location = new System.Drawing.Point(365, 65);
            this.minutesLabel.Name = "minutesLabel";
            this.minutesLabel.Size = new System.Drawing.Size(47, 13);
            this.minutesLabel.TabIndex = 4;
            this.minutesLabel.Text = "Minutes:";
            // 
            // genreLabel
            // 
            this.genreLabel.AutoSize = true;
            this.genreLabel.Location = new System.Drawing.Point(365, 91);
            this.genreLabel.Name = "genreLabel";
            this.genreLabel.Size = new System.Drawing.Size(39, 13);
            this.genreLabel.TabIndex = 5;
            this.genreLabel.Text = "Genre:";
            // 
            // nameTextBox
            // 
            this.nameTextBox.Location = new System.Drawing.Point(434, 36);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(100, 20);
            this.nameTextBox.TabIndex = 6;
            // 
            // minutesTextBox
            // 
            this.minutesTextBox.Location = new System.Drawing.Point(434, 62);
            this.minutesTextBox.Name = "minutesTextBox";
            this.minutesTextBox.Size = new System.Drawing.Size(100, 20);
            this.minutesTextBox.TabIndex = 7;
            // 
            // genreTextBox
            // 
            this.genreTextBox.Location = new System.Drawing.Point(434, 88);
            this.genreTextBox.Name = "genreTextBox";
            this.genreTextBox.Size = new System.Drawing.Size(100, 20);
            this.genreTextBox.TabIndex = 8;
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(591, 34);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(75, 23);
            this.updateButton.TabIndex = 9;
            this.updateButton.Text = "Update";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.updateButton_Click);
            // 
            // deleteButton
            // 
            this.deleteButton.Location = new System.Drawing.Point(591, 60);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(75, 23);
            this.deleteButton.TabIndex = 10;
            this.deleteButton.Text = "Delete";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.deleteButton_Click);
            // 
            // refreshButton
            // 
            this.refreshButton.Location = new System.Drawing.Point(126, 65);
            this.refreshButton.Name = "refreshButton";
            this.refreshButton.Size = new System.Drawing.Size(75, 23);
            this.refreshButton.TabIndex = 11;
            this.refreshButton.Text = "Refresh";
            this.refreshButton.UseVisualStyleBackColor = true;
            this.refreshButton.Click += new System.EventHandler(this.refreshButton_Click);
            // 
            // addButton
            // 
            this.addButton.Location = new System.Drawing.Point(591, 91);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(75, 23);
            this.addButton.TabIndex = 12;
            this.addButton.Text = "Add";
            this.addButton.UseVisualStyleBackColor = true;
            this.addButton.Click += new System.EventHandler(this.addButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(749, 416);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.refreshButton);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.genreTextBox);
            this.Controls.Add(this.minutesTextBox);
            this.Controls.Add(this.nameTextBox);
            this.Controls.Add(this.genreLabel);
            this.Controls.Add(this.minutesLabel);
            this.Controls.Add(this.nameLabel);
            this.Controls.Add(this.labelSong);
            this.Controls.Add(this.songDataGridView);
            this.Controls.Add(this.artistDataGridView);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.artistDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.songDataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView artistDataGridView;
        private System.Windows.Forms.DataGridView songDataGridView;
        private System.Windows.Forms.Label labelSong;
        private System.Windows.Forms.Label nameLabel;
        private System.Windows.Forms.Label minutesLabel;
        private System.Windows.Forms.Label genreLabel;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox minutesTextBox;
        private System.Windows.Forms.TextBox genreTextBox;
        private System.Windows.Forms.Button updateButton;
        private System.Windows.Forms.Button deleteButton;
        private System.Windows.Forms.Button refreshButton;
        private System.Windows.Forms.Button addButton;
    }
}

