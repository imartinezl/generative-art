class TripCount{
  
  Table table;
  
  TripCount(){
      table = loadTable("trips_count.csv", "header");
  for (TableRow row : table.rows()) {

    int id = row.getInt("id");
    String species = row.getString("species");
    String name = row.getString("name");

    println(name + " (" + species + ") has an ID of " + id);
  }
  }
}
