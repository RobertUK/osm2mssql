using System.Threading.Tasks;
using osm2mssql.Importer.OsmReader;
using osm2mssql.Importer.Tasks.ParallelFinishTask;

namespace osm2mssql.Importer.Tasks.FinishTasks
{
    public class TaskCreateSpatialIndices : TaskBase
    {
        public TaskCreateSpatialIndices(string name) : base(TaskType.FinishTask, name)
        {
        }

        protected override Task DoTaskWork(string osmFile, AttributeRegistry attributeRegistry)
        {
            var task1 = Task.Factory.StartNew(() => ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idx_way') CREATE SPATIAL INDEX idx_way ON Way(line) USING GEOGRAPHY_AUTO_GRID"));
            var task2 = Task.Factory.StartNew(() => ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idx_node') CREATE SPATIAL INDEX idx_node ON Node(location) USING GEOGRAPHY_AUTO_GRID"));

            return Task.WhenAll(new[] { task1, task2 });
        }
    }
}
