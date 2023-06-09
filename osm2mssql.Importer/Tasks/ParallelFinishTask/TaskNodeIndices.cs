﻿using System.Threading.Tasks;
using osm2mssql.Importer.OsmReader;

namespace osm2mssql.Importer.Tasks.ParallelFinishTask
{
    class TaskNodeIndices : TaskBase
    {
        public TaskNodeIndices(string name) : base(TaskType.ParallelFinishTask, name)
        {

        }

        protected override async Task DoTaskWork(string osmFile, AttributeRegistry attributeRegistry)
        {
            ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'PK_Node') ALTER TABLE Node ADD CONSTRAINT PK_Node PRIMARY KEY CLUSTERED (Id) " +
                          "WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];");

            ExecuteSqlCmd("IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idxNode') CREATE CLUSTERED INDEX [idxNode] ON [dbo].[NodeTag] ([NodeId] ASC,[Typ] ASC) WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
        }
    }
}
