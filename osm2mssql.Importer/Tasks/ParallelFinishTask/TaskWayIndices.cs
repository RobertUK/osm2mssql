using System.Threading.Tasks;
using osm2mssql.Importer.OsmReader;

namespace osm2mssql.Importer.Tasks.ParallelFinishTask
{
    class TaskWayIndices : TaskBase
    {
        public TaskWayIndices(string name) : base(TaskType.ParallelFinishTask, name)
        {

        }

        protected override async Task DoTaskWork(string osmFile, AttributeRegistry attributeRegistry)
        {
            ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'PK_Way') ALTER TABLE Way ADD CONSTRAINT PK_Way PRIMARY KEY CLUSTERED (Id) " +
                          "WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];");

            ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'PK_WayCreation') ALTER TABLE [WayCreation] ADD CONSTRAINT PK_WayCreation PRIMARY KEY CLUSTERED (wayId,	nodeId,	sort) " +
                          "WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]");

            ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idxWay') CREATE UNIQUE CLUSTERED INDEX [idxWay] ON [dbo].[WayTag] ([WayId] ASC,[Typ] ASC)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
        }
    }
}
