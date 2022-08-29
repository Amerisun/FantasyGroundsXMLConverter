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
            this.ofdGetFGXML = new System.Windows.Forms.OpenFileDialog();
            this.btnMain = new System.Windows.Forms.Button();
            this.clbMain = new System.Windows.Forms.CheckedListBox();
            this.btnProcessFiles = new System.Windows.Forms.Button();
            this.fbdOutputDirectory = new System.Windows.Forms.FolderBrowserDialog();
            this.txtOutputDirectory = new System.Windows.Forms.TextBox();
            this.lblOutputFile = new System.Windows.Forms.Label();
            this.btnOutputDirectory = new System.Windows.Forms.Button();
            this.txtXSLLocation = new System.Windows.Forms.TextBox();
            this.lblXSL = new System.Windows.Forms.Label();
            this.btnFindXSL = new System.Windows.Forms.Button();
            this.btnXSLEmbeded = new System.Windows.Forms.Button();
            this.ofdGetXSL = new System.Windows.Forms.OpenFileDialog();
            this.msMain = new System.Windows.Forms.MenuStrip();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.websiteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.releaseNotesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.btnClearCharXMLFiles = new System.Windows.Forms.Button();
            this.msMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // ofdGetFGXML
            // 
            this.ofdGetFGXML.FileName = "ofdGetFGXML";
            this.ofdGetFGXML.Multiselect = true;
            // 
            // btnMain
            // 
            this.btnMain.Location = new System.Drawing.Point(12, 27);
            this.btnMain.Name = "btnMain";
            this.btnMain.Size = new System.Drawing.Size(213, 38);
            this.btnMain.TabIndex = 0;
            this.btnMain.Text = "Open Fantasy Grounds XML Files";
            this.btnMain.UseVisualStyleBackColor = true;
            this.btnMain.Click += new System.EventHandler(this.btnMain_Click);
            // 
            // clbMain
            // 
            this.clbMain.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.clbMain.CheckOnClick = true;
            this.clbMain.FormattingEnabled = true;
            this.clbMain.Location = new System.Drawing.Point(12, 77);
            this.clbMain.Name = "clbMain";
            this.clbMain.Size = new System.Drawing.Size(776, 130);
            this.clbMain.TabIndex = 1;
            this.clbMain.ThreeDCheckBoxes = true;
            // 
            // btnProcessFiles
            // 
            this.btnProcessFiles.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnProcessFiles.Location = new System.Drawing.Point(12, 290);
            this.btnProcessFiles.Name = "btnProcessFiles";
            this.btnProcessFiles.Size = new System.Drawing.Size(213, 32);
            this.btnProcessFiles.TabIndex = 2;
            this.btnProcessFiles.Text = "Process Files";
            this.btnProcessFiles.UseVisualStyleBackColor = true;
            this.btnProcessFiles.Click += new System.EventHandler(this.btnProcessFiles_Click);
            // 
            // txtOutputDirectory
            // 
            this.txtOutputDirectory.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtOutputDirectory.Location = new System.Drawing.Point(12, 232);
            this.txtOutputDirectory.Name = "txtOutputDirectory";
            this.txtOutputDirectory.Size = new System.Drawing.Size(653, 23);
            this.txtOutputDirectory.TabIndex = 3;
            this.txtOutputDirectory.Leave += new System.EventHandler(this.txtOutputDirectory_Leave);
            // 
            // lblOutputFile
            // 
            this.lblOutputFile.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblOutputFile.AutoSize = true;
            this.lblOutputFile.Location = new System.Drawing.Point(12, 214);
            this.lblOutputFile.Name = "lblOutputFile";
            this.lblOutputFile.Size = new System.Drawing.Size(96, 15);
            this.lblOutputFile.TabIndex = 4;
            this.lblOutputFile.Text = "Output Directory";
            // 
            // btnOutputDirectory
            // 
            this.btnOutputDirectory.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOutputDirectory.Location = new System.Drawing.Point(671, 231);
            this.btnOutputDirectory.Name = "btnOutputDirectory";
            this.btnOutputDirectory.Size = new System.Drawing.Size(117, 23);
            this.btnOutputDirectory.TabIndex = 5;
            this.btnOutputDirectory.Text = "Choose Directory";
            this.btnOutputDirectory.UseVisualStyleBackColor = true;
            this.btnOutputDirectory.Click += new System.EventHandler(this.btnOutputDirectory_Click);
            // 
            // txtXSLLocation
            // 
            this.txtXSLLocation.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtXSLLocation.Location = new System.Drawing.Point(12, 261);
            this.txtXSLLocation.Name = "txtXSLLocation";
            this.txtXSLLocation.Size = new System.Drawing.Size(578, 23);
            this.txtXSLLocation.TabIndex = 6;
            this.txtXSLLocation.Text = "Embeded";
            this.txtXSLLocation.Leave += new System.EventHandler(this.txtXSLLocation_Leave);
            // 
            // lblXSL
            // 
            this.lblXSL.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblXSL.AutoSize = true;
            this.lblXSL.Location = new System.Drawing.Point(425, 214);
            this.lblXSL.Name = "lblXSL";
            this.lblXSL.Size = new System.Drawing.Size(47, 15);
            this.lblXSL.TabIndex = 7;
            this.lblXSL.Text = "XSL File";
            // 
            // btnFindXSL
            // 
            this.btnFindXSL.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnFindXSL.Location = new System.Drawing.Point(596, 261);
            this.btnFindXSL.Name = "btnFindXSL";
            this.btnFindXSL.Size = new System.Drawing.Size(92, 23);
            this.btnFindXSL.TabIndex = 8;
            this.btnFindXSL.Text = "Choose XSL";
            this.btnFindXSL.UseVisualStyleBackColor = true;
            this.btnFindXSL.Click += new System.EventHandler(this.btnFindXSL_Click);
            // 
            // btnXSLEmbeded
            // 
            this.btnXSLEmbeded.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnXSLEmbeded.Location = new System.Drawing.Point(694, 261);
            this.btnXSLEmbeded.Name = "btnXSLEmbeded";
            this.btnXSLEmbeded.Size = new System.Drawing.Size(94, 23);
            this.btnXSLEmbeded.TabIndex = 9;
            this.btnXSLEmbeded.Text = "Use Embedded";
            this.btnXSLEmbeded.UseVisualStyleBackColor = true;
            this.btnXSLEmbeded.Click += new System.EventHandler(this.btnXSLEmbeded_Click);
            // 
            // ofdGetXSL
            // 
            this.ofdGetXSL.FileName = "ofdGetXSL";
            // 
            // msMain
            // 
            this.msMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1});
            this.msMain.Location = new System.Drawing.Point(0, 0);
            this.msMain.Name = "msMain";
            this.msMain.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.msMain.Size = new System.Drawing.Size(800, 24);
            this.msMain.TabIndex = 10;
            this.msMain.Text = "menuStrip1";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.websiteToolStripMenuItem,
            this.releaseNotesToolStripMenuItem,
            this.aboutToolStripMenuItem});
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(44, 20);
            this.toolStripMenuItem1.Text = "Help";
            // 
            // websiteToolStripMenuItem
            // 
            this.websiteToolStripMenuItem.Name = "websiteToolStripMenuItem";
            this.websiteToolStripMenuItem.Size = new System.Drawing.Size(147, 22);
            this.websiteToolStripMenuItem.Text = "Website";
            this.websiteToolStripMenuItem.Click += new System.EventHandler(this.websiteToolStripMenuItem_Click);
            // 
            // releaseNotesToolStripMenuItem
            // 
            this.releaseNotesToolStripMenuItem.Name = "releaseNotesToolStripMenuItem";
            this.releaseNotesToolStripMenuItem.Size = new System.Drawing.Size(147, 22);
            this.releaseNotesToolStripMenuItem.Text = "Release Notes";
            this.releaseNotesToolStripMenuItem.Click += new System.EventHandler(this.releaseNotesToolStripMenuItem_Click);
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(147, 22);
            this.aboutToolStripMenuItem.Text = "About";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // btnClearCharXMLFiles
            // 
            this.btnClearCharXMLFiles.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnClearCharXMLFiles.Location = new System.Drawing.Point(613, 27);
            this.btnClearCharXMLFiles.Name = "btnClearCharXMLFiles";
            this.btnClearCharXMLFiles.Size = new System.Drawing.Size(175, 38);
            this.btnClearCharXMLFiles.TabIndex = 11;
            this.btnClearCharXMLFiles.Text = "Clear XML Files";
            this.btnClearCharXMLFiles.UseVisualStyleBackColor = true;
            this.btnClearCharXMLFiles.Click += new System.EventHandler(this.btnClearCharXMLFiles_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 328);
            this.Controls.Add(this.btnClearCharXMLFiles);
            this.Controls.Add(this.btnXSLEmbeded);
            this.Controls.Add(this.btnFindXSL);
            this.Controls.Add(this.lblXSL);
            this.Controls.Add(this.txtXSLLocation);
            this.Controls.Add(this.btnOutputDirectory);
            this.Controls.Add(this.lblOutputFile);
            this.Controls.Add(this.txtOutputDirectory);
            this.Controls.Add(this.btnProcessFiles);
            this.Controls.Add(this.clbMain);
            this.Controls.Add(this.btnMain);
            this.Controls.Add(this.msMain);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.msMain;
            this.MinimumSize = new System.Drawing.Size(816, 367);
            this.Name = "frmMain";
            this.Text = "Fantasy Grounds XML Converter";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMain_FormClosing);
            this.msMain.ResumeLayout(false);
            this.msMain.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private OpenFileDialog ofdGetFGXML;
        private Button btnMain;
        private CheckedListBox clbMain;
        private Button btnProcessFiles;
        private FolderBrowserDialog fbdOutputDirectory;
        private TextBox txtOutputDirectory;
        private Label lblOutputFile;
        private Button btnOutputDirectory;
        private TextBox txtXSLLocation;
        private Label lblXSL;
        private Button btnFindXSL;
        private Button btnXSLEmbeded;
        private OpenFileDialog ofdGetXSL;
        private MenuStrip msMain;
        private ToolStripMenuItem toolStripMenuItem1;
        private ToolStripMenuItem aboutToolStripMenuItem;
        private ToolStripMenuItem websiteToolStripMenuItem;
        private ToolStripMenuItem releaseNotesToolStripMenuItem;
        private Button btnClearCharXMLFiles;
    }
}