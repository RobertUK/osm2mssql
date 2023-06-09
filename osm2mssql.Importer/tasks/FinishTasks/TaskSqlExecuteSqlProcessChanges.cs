using System.IO;
using System.Threading.Tasks;
using osm2mssql.Importer.OsmReader;
using osm2mssql.Importer.Tasks.ParallelFinishTask;

namespace osm2mssql.Importer.Tasks.FinishTasks
{
    class TaskSqlExecuteSqlProcessChanges : TaskBase
    {
        public TaskSqlExecuteSqlProcessChanges(string name) : base(TaskType.FinishTask, name)
        {

        }

        protected override async Task DoTaskWork(string osmFile, AttributeRegistry attributeRegistry)
        {
            var sql = File.ReadAllText("SQL\\SQLProcessChanges.sql");
            sql = sql.Replace("[OSM]", Connection.InitialCatalog);
            ExecuteSqlCmd(sql);
        }
    }
}
