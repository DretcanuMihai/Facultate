using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


int myMaxRetries = 3;
string myConnectionURL = "Data Source = DESKTOP-RP3BIR1\\SQLEXPRESS; Initial " +
        "Catalog = RoundTheGlobe; Integrated Security = True";

void threadFunction(int threadNumber, int maxRetries, string connectionURL)
{
    Console.WriteLine("Hello" + threadNumber);
    int tries = 0;
    while (tries < maxRetries)
    {
        SqlConnection sqlConnection = new SqlConnection(connectionURL);
        sqlConnection.Open();
        SqlCommand command = new SqlCommand("exec cdeadlock_t" + threadNumber, sqlConnection);
        try
        {
            command.ExecuteNonQuery();
            sqlConnection.Close();
            break;
        }
        catch (Exception)
        {
            sqlConnection.Close();
            Console.WriteLine("Procedure T" + threadNumber + " failed " + (tries + 1) + " times");
        }
        tries++;
    }
    if (tries == maxRetries)
    {
        Console.WriteLine("Procedure T" + threadNumber + " aborted;");
    }
    else
    {
        Console.WriteLine("Procedure T" + threadNumber + " finished with success;");
    }
}

void thread1Function()
{
    threadFunction(1, myMaxRetries, myConnectionURL);
}
void thread2Function()
{
    threadFunction(2, myMaxRetries, myConnectionURL);
}
Thread t1 = new Thread(thread1Function);
Thread t2 = new Thread(thread2Function);
t1.Start();
t2.Start();