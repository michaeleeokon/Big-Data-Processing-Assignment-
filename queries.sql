import java.sql.SQLException;

DROP TABLE IF EXISTS TestHiveTableCSV;
CREATE TABLE TestHiveTableCSV 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' AS
SELECT Column List FROM TestHiveTable;

Start-AzureStorageBlobCopy
-DestContext $destContext 
-SrcContainer "Source Container"
-SrcBlob "hive/warehouse/TestHiveTableCSV/000000_0"
-DestContainer "Destination Container"
-DestBlob "CSV/TestHiveTable.csv"

hive  --outputformat=csv2 -e "select * from yourtable" > my_file.csv
hive  --outputformat=csv2 -e "select * from yourtable" > [your_path]/file_name.csv

hive -e 'select books from table' | grep "|" ' > temp.csv

df=pd.read_csv("temp.csv",sep='|')



public class HiveCreateDb {
   private static String driverName = "org.apache.hadoop.hive.jdbc.HiveDriver";
   
   public static void main(String[] args) throws SQLException {
      // Register driver and create driver instance
   
      Class.forName(driverName);
      // get connection
      
      Connection con = DriverManager.getConnection("jdbc:hive://localhost:10000/default", "", "");
      Statement stmt = con.createStatement();
      
      stmt.executeQuery("CREATE DATABASE userdb");
      System.out.println(“Database userdb created successfully.”);
      
      con.close();
   }
}
