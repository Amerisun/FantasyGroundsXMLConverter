namespace WinFormsApp1
{
    partial class frmMain
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.ofdMain = new System.Windows.Forms.OpenFileDialog();
            this.btnMain = new System.Windows.Forms.Button();
            this.clbMain = new System.Windows.Forms.CheckedListBox();
            this.btnProcessFiles = new System.Windows.Forms.Button();
            this.fbdMain = new System.Windows.Forms.FolderBrowserDialog();
            this.txtOutputDirectory = new System.Windows.Forms.TextBox();
            this.lblOutputFile = new System.Windows.Forms.Label();
            this.btnOutputDirectory = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // ofdMain
            // 
            this.ofdMain.FileName = "ofdMain";
            this.ofdMain.Multiselect = true;
            // 
            // btnMain
            // 
            this.btnMain.Location = new System.Drawing.Point(12, 12);
            this.btnMain.Name = "btnMain";
            this.btnMain.Size = new System.Drawing.Size(213, 32);
            this.btnMain.TabIndex = 0;
            this.btnMain.Text = "Open Fantasy Grounds XML Files";
            this.btnMain.UseVisualStyleBackColor = true;
            this.btnMain.Click += new System.EventHandler(this.btnMain_Click);
            // 
            // clbMain
            // 
            this.clbMain.CheckOnClick = true;
            this.clbMain.FormattingEnabled = true;
            this.clbMain.Location = new System.Drawing.Point(12, 56);
            this.clbMain.Name = "clbMain";
            this.clbMain.Size = new System.Drawing.Size(776, 130);
            this.clbMain.TabIndex = 1;
            this.clbMain.ThreeDCheckBoxes = true;
            // 
            // btnProcessFiles
            // 
            this.btnProcessFiles.Location = new System.Drawing.Point(12, 259);
            this.btnProcessFiles.Name = "btnProcessFiles";
            this.btnProcessFiles.Size = new System.Drawing.Size(213, 32);
            this.btnProcessFiles.TabIndex = 2;
            this.btnProcessFiles.Text = "Process Files";
            this.btnProcessFiles.UseVisualStyleBackColor = true;
            this.btnProcessFiles.Click += new System.EventHandler(this.btnProcessFiles_Click);
            // 
            // txtOutputDirectory
            // 
            this.txtOutputDirectory.Location = new System.Drawing.Point(12, 217);
            this.txtOutputDirectory.Name = "txtOutputDirectory";
            this.txtOutputDirectory.Size = new System.Drawing.Size(284, 23);
            this.txtOutputDirectory.TabIndex = 3;
            this.txtOutputDirectory.Leave += new System.EventHandler(this.txtOutputDirectory_Leave);
            // 
            // lblOutputFile
            // 
            this.lblOutputFile.AutoSize = true;
            this.lblOutputFile.Location = new System.Drawing.Point(12, 199);
            this.lblOutputFile.Name = "lblOutputFile";
            this.lblOutputFile.Size = new System.Drawing.Size(96, 15);
            this.lblOutputFile.TabIndex = 4;
            this.lblOutputFile.Text = "Output Directory";
            // 
            // btnOutputDirectory
            // 
            this.btnOutputDirectory.Location = new System.Drawing.Point(302, 217);
            this.btnOutputDirectory.Name = "btnOutputDirectory";
            this.btnOutputDirectory.Size = new System.Drawing.Size(117, 23);
            this.btnOutputDirectory.TabIndex = 5;
            this.btnOutputDirectory.Text = "Choose Directory";
            this.btnOutputDirectory.UseVisualStyleBackColor = true;
            this.btnOutputDirectory.Click += new System.EventHandler(this.btnOutputDirectory_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(425, 217);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 23);
            this.textBox1.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(425, 199);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 15);
            this.label1.TabIndex = 7;
            this.label1.Text = "label1";
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 306);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.btnOutputDirectory);
            this.Controls.Add(this.lblOutputFile);
            this.Controls.Add(this.txtOutputDirectory);
            this.Controls.Add(this.btnProcessFiles);
            this.Controls.Add(this.clbMain);
            this.Controls.Add(this.btnMain);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmMain";
            this.Text = "Fantasy Grounds XML to Json Converter";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMain_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private OpenFileDialog ofdMain;
        private Button btnMain;
        private CheckedListBox clbMain;
        private Button btnProcessFiles;
        private FolderBrowserDialog fbdMain;
        private TextBox txtOutputDirectory;
        private Label lblOutputFile;
        private Button btnOutputDirectory;
        private TextBox textBox1;
        private Label label1;
    }
}