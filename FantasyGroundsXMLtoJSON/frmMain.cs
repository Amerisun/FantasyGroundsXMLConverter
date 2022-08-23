using FantasyGroundsXMLtoJson.Properties;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using Saxon.Api;

namespace WinFormsApp1
{
    public partial class frmMain : Form
    {
        #region "Form handling parts"
        
        public frmMain()
        {
            InitializeComponent();
            txtOutputDirectory.Text = FantasyGroundsXMLtoJson.Properties.Settings.Default.OutputDirectory;
            txtXSLLocation.Text = FantasyGroundsXMLtoJson.Properties.Settings.Default.XSLFileLocation;
            ofdGetXSL.InitialDirectory = FantasyGroundsXMLtoJson.Properties.Settings.Default.XSLDirectoryLocation;
            fbdOutputDirectory.InitialDirectory = FantasyGroundsXMLtoJson.Properties.Settings.Default.OutputDirectory;
            ofdGetFGXML.InitialDirectory = FantasyGroundsXMLtoJson.Properties.Settings.Default.XMLCharacterLocation;
        }

        private void btnMain_Click(object sender, EventArgs e)
        {
            ofdGetFGXML.Title = "Choose Fantasy Grounds XML Files"; 
            ofdGetFGXML.Filter = "xml files (*.xml)|*.xml";
            DialogResult dr = this.ofdGetFGXML.ShowDialog();
            if (dr == System.Windows.Forms.DialogResult.OK)
            {
                foreach (var item in ofdGetFGXML.FileNames)
                {
                    if (!clbMain.Items.Contains(item))
                    {
                        clbMain.Items.Add(item, true);
                        ofdGetFGXML.InitialDirectory = System.IO.Path.GetDirectoryName(item);
                    }
                }
            }
        }
        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            FantasyGroundsXMLtoJson.Properties.Settings.Default.OutputDirectory = txtOutputDirectory.Text;
            FantasyGroundsXMLtoJson.Properties.Settings.Default.XSLFileLocation = txtXSLLocation.Text;
            FantasyGroundsXMLtoJson.Properties.Settings.Default.XSLDirectoryLocation = ofdGetXSL.InitialDirectory;
            FantasyGroundsXMLtoJson.Properties.Settings.Default.XMLCharacterLocation = ofdGetFGXML.InitialDirectory;
            FantasyGroundsXMLtoJson.Properties.Settings.Default.Save();
        }

        #endregion

        private void btnOutputDirectory_Click(object sender, EventArgs e)
        {
            fbdOutputDirectory.Description = "Pick output directory"; 
            DialogResult result = fbdOutputDirectory.ShowDialog();

            if (result == DialogResult.OK)
            {
                txtOutputDirectory.Text = fbdOutputDirectory.SelectedPath;
                fbdOutputDirectory.InitialDirectory = fbdOutputDirectory.SelectedPath;
                if (!txtOutputDirectory.Text.EndsWith("\\"))
                {
                    txtOutputDirectory.Text = txtOutputDirectory.Text + "\\";
                }
            }
        }
        private void btnFindXSL_Click(object sender, EventArgs e)
        {
            string folderPath = "";
            ofdGetXSL.Filter = "xsl files (*.xsl)|*.xsl";
            if (ofdGetXSL.ShowDialog() == DialogResult.OK)
            {
                txtXSLLocation.Text = ofdGetXSL.FileName;
                folderPath = Path.GetDirectoryName(ofdGetXSL.FileName);
            }
            ofdGetXSL.InitialDirectory = folderPath;
        }

        private void btnProcessFiles_Click(object sender, EventArgs e)
        {
            // Only process if there is a directory to output, an XSL chosen and something in the combo box chosen.
            if (txtXSLLocation.Text != "" && txtOutputDirectory.Text != "" && clbMain.CheckedItems.Count > 0)
            {
                Saxon.Api.Processor myProcessor = new Saxon.Api.Processor();
                XsltCompiler myCompiler = myProcessor.NewXsltCompiler();

                FileStream fs;
                XsltTransformer xslt;
                XsltExecutable executable;

                //XslTransform myXslTransform = new XslTransform();
                if (txtXSLLocation.Text == "Embeded")
                {
                    string myDirectory = Directory.GetCurrentDirectory();
                    fs = File.OpenRead(myDirectory + @"\5e.xsl");
                    //myXslTransform.Load(myDirectory + @"\5e.xsl");
                }
                else
                {
                    fs = File.OpenRead(txtXSLLocation.Text);
                    //myXslTransform.Load(txtXSLLocation.Text);
                }

                executable = myCompiler.Compile(fs);

                xslt = executable.Load();

                for (int i = 0; i < clbMain.Items.Count; i++)
                {
                    if (clbMain.GetItemCheckState(i).Equals(CheckState.Checked))
                    {
                        string xmlCharFileName = clbMain.Items[i].ToString();
                        string jsonCharFileName = txtOutputDirectory.Text + System.IO.Path.ChangeExtension(Path.GetFileName(xmlCharFileName), ".json");

                        XPathDocument myCharacterData = new XPathDocument(xmlCharFileName);

                        FileStream writer = new FileStream(jsonCharFileName, FileMode.Create);

                        FileStream myInputDocument = File.OpenRead(xmlCharFileName);
                        Uri myUri = new Uri(Path.GetDirectoryName(xmlCharFileName).ToString());
                        xslt.SetInputStream(myInputDocument, myUri);

                        Serializer mySerializer = myProcessor.NewSerializer(writer);
                        xslt.Run(mySerializer);

                        //myXslTransform.Transform(myCharacterData, null, writer, null);

                        writer.Close();
                    }
                }
            } else
            {
                MessageBox.Show("Please make sure to have at least one XML file checked in the list box, a good XSL chosen and an output directory first");
            }
        }

        private void btnXSLEmbeded_Click(object sender, EventArgs e)
        {
            txtXSLLocation.Text = "Embeded";
        }

        private void txtOutputDirectory_Leave(object sender, EventArgs e)
        {
            if (!Directory.Exists(txtOutputDirectory.Text) && !(txtOutputDirectory.Text == ""))
            {
                MessageBox.Show("Directory cannot be found, please enter a directory that exists");
                txtOutputDirectory.Text = "";
            }

            if (!txtOutputDirectory.Text.EndsWith("\\"))
            {
                txtOutputDirectory.Text = txtOutputDirectory.Text + "\\";
            }
        }

        private void txtXSLLocation_Leave(object sender, EventArgs e)
        {
            if (!File.Exists(txtXSLLocation.Text) && !(txtXSLLocation.Text == "Embeded"))
            {
                MessageBox.Show("XSL cannot be found, please enter or find an XSL that exists");
                txtXSLLocation.Text = "Embeded";
            }
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FantasyGroundsXMLtoJson.frmAbout newAboutForm = new FantasyGroundsXMLtoJson.frmAbout();
            newAboutForm.Show();
        }

        private void websiteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenBrowser("http://fgxmltojson.amerisun.me/");
        }

        private void releaseNotesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenBrowser("http://fgxmltojson.amerisun.me/releasenotes");
        }

        public static void OpenBrowser(string url)
        {
            try
            {
                Process.Start(url);
            }
            catch
            {
                // hack because of this: https://github.com/dotnet/corefx/issues/10361
                if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                {
                    url = url.Replace("&", "^&");
                    Process.Start(new ProcessStartInfo("cmd", $"/c start {url}") { CreateNoWindow = true });
                }
                else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
                {
                    Process.Start("xdg-open", url);
                }
                else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
                {
                    Process.Start("open", url);
                }
                else
                {
                    throw;
                }
            }
        }

        private void btnClearCharXMLFiles_Click(object sender, EventArgs e)
        {
            clbMain.Items.Clear();
        }
    }
}