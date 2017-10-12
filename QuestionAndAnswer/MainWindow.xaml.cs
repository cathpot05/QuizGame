using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace QuestionAndAnswer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        int[] randomQuestionsNum;
        //int[] prevQuestions;
        int NextVal =0;
        int curValue = 0;
        int i = 0;
        string[] levelname = {"Easy","Medium", "Hard","Jackpot"};
        int levelCounter = 0;
        int currentA = 0;
        int y = 1;
        int tik = 60;
        DispatcherTimer timer1 = new DispatcherTimer();

        public MainWindow()
        {
            InitializeComponent();
            
        }

        private void getTotalCount()
        {
            int numX;
            string q;
            SqlConnect con = new SqlConnect();
            con.conOpen();
            if (con != null)
            {
                if(levelCounter >= 3)
                {
                    
                    q = "Select TOP 1 A.id, '1' as count from tblQuestions A INNER JOIN tblLevel B ON A.levelid = B.LevelId WHERE B.LevelName = '" + levelname[levelCounter].ToString().Trim() + "' ORDER BY NEWID()";
                }
                else
                {
                    
                     q = "Select TOP 5 A.id , '5' as count from tblQuestions A INNER JOIN tblLevel B ON A.levelid = B.LevelId WHERE B.LevelName = '" + levelname[levelCounter].ToString().Trim() + "' ORDER BY NEWID()";
                }
                //string q = "Select '"+ topConcat + "' COUNT(A.id)as count from tblQuestions A INNER JOIN tblLevel B ON A.levelid = B.LevelId WHERE B.LevelName = '" + levelname[levelCounter].ToString().Trim() + "' ORDER BY NEWID()";

                SqlCommand cmd = new SqlCommand(q, con.Con);

                try
                {
                    using (SqlDataReader read = cmd.ExecuteReader())
                    {
                        while (read.Read())
                        {
                            numX = Convert.ToInt32((read["count"]).ToString());
                            randomQuestionsNum = new int[numX];
                        }
                    }
                }

                catch (Exception ex)
                {
                    Console.WriteLine("Debug at getTotalCount Function");
                    Console.WriteLine(ex.Message);
                }
                con.conclose();
            }
        }

        private void getRandomQuestions()
        {
            string q;
            SqlConnect con = new SqlConnect();
            con.conOpen();
            if (con != null)
            {
                if (levelCounter >= 3) 
                {
                    q = "SELECT TOP 1 A.id, B.LevelName, B.Amount From tblQuestions A INNER JOIN tblLevel B ON A.levelid = B.LevelId WHERE B.LevelName = '" + levelname[levelCounter].ToString().Trim() + "' ORDER BY NEWID()";
                }
                else
                {
                    q = "SELECT TOP 5 A.id, B.LevelName, B.Amount From tblQuestions A INNER JOIN tblLevel B ON A.levelid = B.LevelId WHERE B.LevelName = '" + levelname[levelCounter].ToString().Trim() + "' ORDER BY NEWID()";
                }
                
                SqlCommand cmd = new SqlCommand(q, con.Con);
                try
                {
                    using (SqlDataReader read = cmd.ExecuteReader())
                    {
                        while (read.Read())
                        {
                            randomQuestionsNum[i] = Convert.ToInt32((read["id"]).ToString());
                            tbRound.Text ="Round: " + (read["LevelName"]).ToString();
                            tbAmount.Text = (read["Amount"]).ToString();
                            i += 1;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Debug at getRandomQuestion Function");
                    Console.WriteLine(ex.Message);
                }
                con.conclose();
            }

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            getTotalCount();
            getRandomQuestions();
            displayQuestion(randomQuestionsNum[0]);
            displayAnswer(randomQuestionsNum[0]);
            NextVal = curValue + 1;
            timer1.Interval = new TimeSpan(0, 0, 1);
            timer1.Tick += new EventHandler(timer1_Tick);

        }

        void timer1_Tick(object sender, EventArgs e)
        {
            tbTimer.Text = tik + " Seconds Remaining";
            if (tik > 0)
                tik--;
            else
                tbTimer.Text = "Times Up";
            
        }

        private void displayQuestion(int id)
        {
            SqlConnect con = new SqlConnect();
            con.conOpen();
            if (con != null)
            {
                string q = "SELECT * FROM tblQuestions A WHERE id = '"+id+"' ";
                SqlCommand cmd = new SqlCommand(q, con.Con);

                try
                {
                    using (SqlDataReader read = cmd.ExecuteReader())
                    {
                        while (read.Read())
                        {
                            tbQuestion.Text = (read["Question"]).ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Debug at displayQuestion Function");
                    Console.WriteLine(ex.Message);
                }
                con.conclose();
            }
        }

        private void next_Click(object sender, RoutedEventArgs e)
        {

            curValue += 1;
            btnSubmit.IsEnabled = true;
            //prevValue = curValue - 1;
            if (curValue >= randomQuestionsNum.Length)
            {
                if(levelCounter <= 3)
                {
                    if(levelCounter == 3)
                    {
                        lifline1.IsEnabled = false;
                        lifeline2.IsEnabled = false;
                        lifeline3.IsEnabled = false;

                    }
                    curValue = 0;
                    i = 0;
                    levelCounter += 1;
                    Array.Clear(randomQuestionsNum, 0, randomQuestionsNum.Length);
                    if(levelCounter > 3)
                    {
                        MessageBox.Show("Congratulations! You won " +tbCurrentAmount.Text);
                        System.Windows.Application.Current.Shutdown();
                        return;
                    }
                    MessageBox.Show("Congratulations! Next Level: "+levelname[levelCounter]);
                    getTotalCount();
                    getRandomQuestions();
                    //displayQuestion(randomQuestionsNum[0]);
                    //displayAnswer(randomQuestionsNum[0]);
                    NextVal = curValue + 1;
                    

                }
                else
                {
                    MessageBox.Show("No more questions to show.");
                    System.Windows.Application.Current.Shutdown();
                    return;
                }
                
            }
            displayQuestion(randomQuestionsNum[curValue]);
            clearRbtn();
            displayAnswer(randomQuestionsNum[curValue]);

            
            //randomQuestionsNum[curValue];
        }

        private void displayAnswer(int id)
        {
            y = 1;
            SqlConnect con = new SqlConnect();
            con.conOpen();
            if (con != null)
            {
                
                string q = "SELECT * From tblAnswers Where questionid = '"+id+"' ORDER BY NEWID()";
                SqlCommand cmd = new SqlCommand(q, con.Con);

                try
                {
                    using (SqlDataReader read = cmd.ExecuteReader())
                    {
                        while (read.Read())
                        {
                            RadioButton radiobtn = (RadioButton)radioPanel.FindName("r" + y);
                            TextBlock tbVal = (TextBlock)radioPanel.FindName("tb" + y);
                            radiobtn.Content = (read["Choices"]).ToString();
                            tbVal.Text = (read["isCorrect"]).ToString();
                            if (y <= 4)
                            {
                                y += 1;
                            }

                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Debug at displayAnswer Function");
                    Console.WriteLine(ex.Message);
                }
                con.conclose();
            }
            tik = 60;
            timer1.Start();

        }

        private void clearRbtn()
        {
            r1.IsChecked = false;
            r2.IsChecked = false;
            r3.IsChecked = false;
            r4.IsChecked = false;
            r1.Visibility = Visibility.Visible;
            r2.Visibility = Visibility.Visible;
            r3.Visibility = Visibility.Visible;
            r4.Visibility = Visibility.Visible;
        }

        public static IEnumerable<T> FindVisualChildren<T>(DependencyObject depObj) where T : DependencyObject
        {
            if (depObj != null)
            {
                for (int i = 0; i < VisualTreeHelper.GetChildrenCount(depObj); i++)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(depObj, i);
                    if (child != null && child is T)
                    {
                        yield return (T)child;
                    }

                    foreach (T childOfChild in FindVisualChildren<T>(child))
                    {
                        yield return childOfChild;
                    }
                }
            }
        }

        private void btnSubmit_Click(object sender, RoutedEventArgs e)
        {
            if (r1.IsChecked == false && r2.IsChecked == false && r3.IsChecked == false && r4.IsChecked == false)
            {
                MessageBox.Show("Please choose an answer!");
                return;
            }

            timer1.Stop();
            btnSubmit.IsEnabled = false;
            
            foreach (RadioButton rbn in FindVisualChildren<RadioButton>(radioPanel))
            {
                if(rbn.IsChecked == true)
                {
                    string name = rbn.Name;
                    string tbname = name.Replace("r", "tb").Trim().ToString();
                    TextBlock tbVal = (TextBlock)radioPanel.FindName(tbname);
                    if(tbVal.Text == "1")
                    {
                        
                        currentA += Convert.ToInt32(tbAmount.Text);
                        tbCurrentAmount.Text = "$" + currentA;
                        MessageBox.Show("Correct");
                        next_Click(sender, e);
                    }
                    else
                    {

                        MessageBox.Show("Wrong! You Loose!");
                        foreach (TextBlock tbn in FindVisualChildren<TextBlock>(radioPanel))
                        {
                            if(tbn.Text == "1")
                            {
                                string nametbn = tbn.Name;
                                string rbname = nametbn.Replace("tb", "r").Trim().ToString();
                                RadioButton rbnX = (RadioButton)radioPanel.FindName(rbname);
                                rbnX.Foreground = new SolidColorBrush(Colors.Yellow);
                                next.IsEnabled = false;
                                System.Windows.Application.Current.Shutdown();
                                return;
                            }
                        }
                    }
                }
            }
        }

        private void lifline1_Click(object sender, RoutedEventArgs e)
        {
            lifline1.IsEnabled = false;
            int remove = 1;
            for(int counter = 1; counter <= 4; counter++)
            {
                if (remove <= 2)
                {
                    TextBlock tbVal = (TextBlock)radioPanel.FindName("tb" + counter);
                    if (tbVal.Text != "1")
                    {
                        RadioButton rbnX = (RadioButton)radioPanel.FindName("r"+counter);
                        rbnX.Visibility = Visibility.Hidden;
                        remove += 1;
                    }
                }
            }
        }

        private void displaySwitchQuestion()
        {
            y = 1;
            //curValue += 1;
            SqlConnect con = new SqlConnect();
            con.conOpen();
            if (con != null)
            {
                string q = "SELECT C.Question, A.Choices, A.isCorrect, D.LevelName FROM tblSwitchAnswer A INNER JOIN (SELECT TOP 1 X.switchid FROM tblSwitchQuestions X INNER JOIN tblLevel Z ON X.levelid = Z.LevelId WHERE Z.LevelName= '" + levelname[levelCounter]+"' ORDER BY NEWID()) B ON A.questionid = B.switchid INNER JOIN tblSwitchQuestions C ON B.switchid =  C.switchid INNER JOIN tblLevel D ON C.levelid =  D.LevelId ORDER BY NEWID() ";
                SqlCommand cmd = new SqlCommand(q, con.Con);

                try
                {
                    using (SqlDataReader read = cmd.ExecuteReader())
                    {
                        while (read.Read())
                        {
                            tbQuestion.Text = (read["Question"]).ToString();
                            RadioButton radiobtn = (RadioButton)radioPanel.FindName("r" + y);
                            TextBlock tbVal = (TextBlock)radioPanel.FindName("tb" + y);
                            radiobtn.Content = (read["Choices"]).ToString();
                            tbVal.Text = (read["isCorrect"]).ToString();
                            if (y <= 4)
                            {
                                y += 1;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Debug at displaySwitchQuestion Function");
                    Console.WriteLine(ex.Message);
                }
                con.conclose();
            }
        }

        private void lifeline2_Click(object sender, RoutedEventArgs e)
        {
            lifeline2.IsEnabled = false;
            displaySwitchQuestion();
        }
    }
}
