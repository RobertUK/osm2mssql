using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Description;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;
using System.Web.Routing;
using System.Windows;
using System.Windows.Input;
using System.Windows.Threading;
using System.Xml.Serialization;
using Microsoft.Win32;
using osm2mssql.Importer.Classes;
using osm2mssql.Importer.Enums;
using osm2mssql.Importer.Languages;
using osm2mssql.Importer.Model;
using osm2mssql.Importer.Tasks;
using osm2mssql.Importer.Tasks.FinishTasks;
using osm2mssql.Importer.Tasks.InitializeTasks;

namespace osm2mssql.Importer.ViewModel
{
    public class ImporterViewModel : ViewModelBase
    {
        public ICommand TryToConnect { get { return new RelayCommand(TryConnectingToDatabase); } }
        public ICommand StartImport { get { return new RelayCommand(StartImporting); } }

        public ConnectionResult LastTryConnectionResult
        {
            get { return _lastTryConnectionResult; }
            set
            {
                _lastTryConnectionResult = value;
                RaisePropertyChanged();
            }
        }

        public bool IsNotProcessing
        {
            get { return _isNotProcessing; }
            set
            {
                _isNotProcessing = value;
                RaisePropertyChanged();
            }
        }

        public bool SelectAll
        {
            get { return this._selectAll; }
            set
            {
                if (value != SelectAll)
                {
                    this._selectAll = value;
                    foreach (var task in Tasks)
                        task.IsEnabled = this._selectAll;
                }

                //if (value != SelectAll)
                //{
                    
                //        foreach (var task in Tasks)
                //        task.IsEnabled =false;

                //    this.RaisePropertyChanged("SelectAll");
                //}

                //this._selectAll = value.Value;
                //foreach (var task in Tasks)
                //{
                //    task.IsEnabled=true;
                //}
                this.RaisePropertyChanged("SelectAll");
            }
        }

        public IEnumerable<TaskBase> Tasks { get { return _runner.Tasks; } }
        public ImporterModel Model { get; set; }
        public ObservableCollection<string> LogRows { get; private set; }

        private bool _selectAll = false;
        private bool _isNotProcessing = true;
        private ConnectionResult _lastTryConnectionResult;

        private readonly TaskRunner _runner = new TaskRunner();
        private readonly SqlDbAvailableChecker _dbChecker = new SqlDbAvailableChecker();
        private readonly OsmConnectionStringBuilder _connStringBuilder = new OsmConnectionStringBuilder();
        private const string ViewModelSettings = "osm2mssql.xml";

        public ImporterViewModel()
        {
            Model = LoadModelFromFile<ImporterModel>(ViewModelSettings);
            var dispatcher = Dispatcher.CurrentDispatcher;
            LogRows = new ObservableCollection<string>();
            if (!Trace.Listeners.OfType<WpfTraceListener>().Any())
            {
                Trace.Listeners.Add(new WpfTraceListener(x => dispatcher.BeginInvoke(new Action(() => LogRows.Add(x)))));
            }
            dispatcher.ShutdownStarted += (o, e) => SaveModelToFile(ViewModelSettings, Model);
            _runner.FillTaskList();
        }

        private async void TryConnectingToDatabase()
        {
            LastTryConnectionResult = await _dbChecker.CheckDatabaseAvailability(_connStringBuilder.CreateSqlConnectionStringBuilder(Model));
            _runner.FillTaskList();
        }

        private async void StartImporting()
        {
            var con = _connStringBuilder.CreateSqlConnectionStringBuilder(Model);
            try
            {
                var createDb = _runner.Tasks.OfType<TaskCreateDatabase>().Where(x=>x.IsEnabled);


                IsNotProcessing = false;

                if (createDb.Any())
                {
                    LastTryConnectionResult = await _dbChecker.CheckDatabaseAvailability(_connStringBuilder.CreateSqlConnectionStringBuilder(Model));

                    if (LastTryConnectionResult == ConnectionResult.DbAlreadyExists)
                    {
                        if (MessageBox.Show("The database already exists, replace it ?", "Duplicate", MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes)
                            return;
                    }

                    if (LastTryConnectionResult != ConnectionResult.DbAlreadyExists &&
                   LastTryConnectionResult != ConnectionResult.Successful)
                        return;
                }

               

                var fd = new OpenFileDialog();
                fd.Filter = "OpenStreetMap Files (*.xml, *.pbf)|*.xml;*.pbf|All files (*.*)|*.*";
                if (fd.ShowDialog() != true)
                    return;
                
                await _runner.RunTasks(con, fd.FileName);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Exception", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                
                IsNotProcessing = true;
           
            }
        }


    }
}
