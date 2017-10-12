using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuestionAndAnswer
{
    class SqlConnect
    {

        public SqlConnection Con { get; set; }
        public string conString { get; set; }


        public void conOpen()
        {
            conString = @"Data Source= P2B4RND242\SQLEXPRESS; Initial Catalog= Db_QandA; Integrated Security = True;";
            Con = new SqlConnection(conString);
            try
            {
                Con.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please check the connection.");
                Console.Write("Cannot connect. Check the connection" + ex.Message);
            }
        }

        public void conclose()
        {
            Con.Close();
        }


    }
}
