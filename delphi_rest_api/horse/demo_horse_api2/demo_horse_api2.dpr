program demo_horse_api2;
{$APPTYPE CONSOLE}

{$R *.res}
uses
  Horse,
  System.SysUtils,
  index in 'src\routes\index.pas',
  employee in 'src\routes\employee.pas',
  Udatamodule in 'src\data\Udatamodule.pas' {DMMain: TDataModule};

begin
    // Create Datamodule
    DMMain := TDMMain.Create(NIL);

  try
   // THorse.Use(ServerStatic('web'));
    with THorse.Group.Prefix('/api') do
    begin
      Route('/').Get(index.API_Index); // home
      // Get
      Route('/employees').Get(employee.Get_Employees); // get All Employee
      Route('/employeebi/:id').Get(employee.Get_Employee); // get employee by id
      Route('/employeebn/:name').Get(employee.Get_Employee_LikeName); // get All employee like Name
      // Create
      Route('/employeecreate').Post(employee.Create_Employee); // delete employee by id
      // Delete
      Route('/employeebi/:id').Delete(employee.Delete_Employee); // delete employee by id
      // update
      Route('/employeebi/:id').Put(employee.Update_Employee); // update employee by id
      Route('/upload/:id').Post(employee.empUpload); // upload files
    end;
    THorse.Listen(8080,
            // TProc
    		procedure(Horse: THorse)
            begin
		        Writeln(Format('Server is runing on %s:%d', [Horse.Host, Horse.Port]));
                // Server is runing on Localhost : 8080
                // Server is runing on 0.0.0.0 : 8080
            end
    );
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
