   M S B A M L   `   `   `  ���� D  @osm2mssql, Version=0.3.5.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:osm2mssql.Importer.ViewModelosm2mssql.Importer.ViewModel  )    #osm2mssql.Importer.Views.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @	ViewModel*clr-namespace:osm2mssql.Importer.ViewModel       � Title$  	osm2mssql��$	��550��$	��500��$	��800�� � Icon$ ../Images/App.ico�� � 	Resources 4   .osm2mssql.Importer.ViewModel.ImporterViewModel   vm��%   &	          .���  � DataContext# [   � ColumnDefinitions �� $	��500 ��� $��* �.+��� $��1��$��3q����� *	LogRows+�� $��3q�����  �� Orientation$ 
Horizontal=�.+��� $��16��$��3,0,3,0q�$��../Images/world.png���� $��Importer��$��Center=�$��3q�.��� $��4q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��3q�$��0��  DatabaseConnectionSettings#��[ .���  �� $
��Auto ��� $��* ��� $
��Auto � �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� $	��120��$��2��$��3q�$��../Images/osm2mssql.png��$��10���� $��3q�$��Center=�$��Right=�$��0��$��0��  Host#��[ � $��1��$��0��.+��� $��3q�$��Center=����� *
Model.Host+ �� Mode$ TwoWay=��� $��16�� J� Opacity$	 0.8Q�	 J� IsHitTestVisible	 .  $��Right=�$��Center=�$��3q�$��../Images/world.png���� $��3q�$��Center=�$��Right=�$��0��$��1��  Database#��[ � $��1��$��1��.+��� $��3q�$��Center=�$��1��$��1������ *Model.Database+$ TwoWay=��� $��16��$	 0.8Q�	 .  $��Right=�$��Center=�$��3q�$��../Images/star.png���� $��3q�$��Center=�$��Right=�$��0��$��2��  Username#��[ � $��1��$��2��.+��� $��3q�$��Center=�$��1��$��2������ *Model.Username+$ TwoWay=��� $��16��$	 0.8Q�	 .  $��Right=�$��Center=�$��3q�$��../Images/user.png���� $��3q�$��Center=�$��Right=�$��0��$��3��  Password#��[ � $��1��$��3��.+��� $��3q�$��Center=�$��1��$��3������ *Model.Password+$ TwoWay=��� $��16��$	 0.8Q�	 .  $��Right=�$��Center=�$��3q�$��../Images/key.png���� $��5��$��0��$��16������ 
 �� 
TargetType"
 ��.���  �� Property � �� �� Value$ ../Images/ok.png�� �� Triggers ��  �� Binding �� *LastTryConnectionResult+ �� Value Unknown.a���  � y�$ 	Collapsed=���  �� *LastTryConnectionResult+ 
Successful.a���  � ��$ ../Images/ok.png����  �� *LastTryConnectionResult+	 Error.a���  � ��$ ../Images/error.png����  �� *LastTryConnectionResult+ DbAlreadyExists.a���  � ��$ ../Images/warning.png���� $��3q�$��Center=�$��5��$��1��  TryToConnect#��[ ���� *TryToConnect+�� $��1�� 
 Import#��[ $��3q�.���  �� $��* ��� $
��Auto �.+��� $��3q�$��0������ *Tasks+���� .R��� $��Stretch=�$
��Auto=�.���� $��Stretch=����� .R��� $��Stretch=�$��Center=� d� 	IsChecked �� *	IsEnabled+$ TwoWay=�.��� $��3q� �� $
��Auto ��� $��* ��� $
��Auto ��� $��64 ��� $
��Auto �.+��� $��16��$��3q����� "
 �� ��  �� *Result+ Pending.a���  � ��$ ../Images/arrowright.png����  �� *Result+ 
InProgress.a���  � ��$ ../Images/refresh.png����  �� *Result+	 Error.a���  � ��$ ../Images/error.png����  �� *Result+ 
Successful.a���  � ��$ ../Images/ok.png���� $��1��$��Center=����� *Name+�� $��2��$��Center=����� *AdditionalInfos+� $��3��$��3q�$��13�� � IsIndeterminate . $��Center=����� "
 �.���  � y�$ 	Collapsed=� ��  �� *Result+ 
InProgress.a���  � y�$ Visible=��� $��4��$��Center=����� *
Duration+ �� StringFormat$ 
hh\:mm\:ss������ "
 ��.���  � y�$ Visible=� ��  �� *Result+ Pending.a���  � y�$ 	Collapsed=��� $��0��$��../Images/osm.png��$
 0.15Q�$��8q��� $��3q�$��Center=�$��1��  StartImport#��[ {��� *IsNotProcessing+���� *StartImport+