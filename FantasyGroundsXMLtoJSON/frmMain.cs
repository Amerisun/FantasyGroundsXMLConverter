using System.Reflection;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;

namespace WinFormsApp1
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
            txtOutputDirectory.Text = FantasyGroundsXMLtoJson.Properties.Settings.Default.OutputDirectory;
        }

        private void btnMain_Click(object sender, EventArgs e)
        {
            DialogResult dr = this.ofdMain.ShowDialog();
            if (dr == System.Windows.Forms.DialogResult.OK)
            {
                foreach (var item in ofdMain.FileNames)
                {
                    clbMain.Items.Add(item, true);
                }
            }
        }

        private void btnOutputDirectory_Click(object sender, EventArgs e)
        {
            DialogResult result = fbdMain.ShowDialog();
            if (result == DialogResult.OK)
            {
                txtOutputDirectory.Text = fbdMain.SelectedPath;
            }
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            FantasyGroundsXMLtoJson.Properties.Settings.Default.OutputDirectory = txtOutputDirectory.Text;
            FantasyGroundsXMLtoJson.Properties.Settings.Default.Save();
        }

        private void btnProcessFiles_Click(object sender, EventArgs e)
        {
            XslTransform xslt = new XslTransform();
            for (int i = 0; i < clbMain.Items.Count; i++)
            {
                if (clbMain.GetItemCheckState(i).Equals(CheckState.Checked))
                {
                    //clbMain.Items[i].ToString();
                    string startPath = Path.GetDirectoryName(System.AppDomain.CurrentDomain.BaseDirectory) + @"\CharacterSheet_DND5E_To_JSon.xsl";
                    xslt.Load(startPath);

                    XPathDocument myData = new XPathDocument(clbMain.Items[i].ToString());

                    XmlWriter writer = new XmlTextWriter(txtOutputDirectory.Text, Encoding.UTF8);
                }
            }
        }

        private void txtOutputDirectory_Leave(object sender, EventArgs e)
        {
            if (!Directory.Exists(txtOutputDirectory.Text))
            {
                MessageBox.Show("Directory cannot be found, please enter a directory that exists");
                txtOutputDirectory.Text = "";
            }
        }
    }
}