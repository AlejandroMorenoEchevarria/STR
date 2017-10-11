with Text_IO; use Text_IO;

procedure Main is

   --Declaramos los tipos que vamos a utilziar

   type NOMBRE_MES is (Enero, Febrero, Marzo, Abril, Mayo,
                       Junio, Julio, Agosto, Septiembre, Octubre, Noviembre, Diciembre);
   type FECHA is
      record
         DIA: Integer range 1..31;
         MES: NOMBRE_MES;
         ANIO: Integer range 1900..2100;
      end record;
   type Tmp is delta 0.01 range -25.0..75.0;

   --Añadimos los paquetes necesarios para la realización de la practica

   package IIO is new Integer_IO(INTEGER); use IIO;
   package FIO is new Fixed_IO(Tmp); use FIO;
   package MIO is new Enumeration_IO(ENUM => NOMBRE_MES); use MIO;

   --Declaramos tambien las variables necesarias

   N_tmp: Integer:=1;

begin

   PUT("NUMERO DE TEMPERATURAS RECOGIDAS: ");
   GET(N_tmp);
   New_Line;

   declare
      Fechas: array(1..N_tmp) of FECHA;
      Tmps: array(1..N_tmp) of Tmp;

      T_min: Tmp:=75.0;
      T_max: Tmp:=-25.0;

      Pos_min: Integer:=0;
      Pos_max: Integer:=0;

      Tmp_total: Tmp:=0.0;
      media: float digits 3:=0.0;

   begin

      for i in 1..N_tmp loop
         Put("Dia: ");
         Get(Fechas(i).DIA);
         New_Line;

         Put("Mes: ");
         Get(Fechas(i).MES);
         New_Line;

         Put("Anio: ");
         Get(Fechas(i).ANIO);
         New_Line;

         Put("Temperatura recogida: ");
         Get(Tmps(i));
         New_Line;

         if(Tmps(i) < T_min)then
            T_min := Tmps(i);
            Pos_min := i;
         end if;
         if(Tmps(i) > T_max)then
             T_max := Tmps(i);
             Pos_max := i;
         end if;


         Tmp_total := Tmp_total+Tmps(i);
      end loop;

      media := (Float(Tmp_total))/(Float(N_tmp));

      Put("La temperatura mas baja recogida fue: ");
      New_Line;
      Put_Line(Tmp'Image(T_min) &
                 "º, alcanzada el " & Integer'Image(FECHAS(Pos_min).DIA) &
                 " de " &  NOMBRE_MES'Image(FECHAS(Pos_min).MES) &
                 " del anio "  & Integer'Image(FECHAS(Pos_min).ANIO));
      New_Line;

      Put("La temperatura mas alta recogida fue: ");
      New_Line;
      Put_Line(Tmp'Image(T_max) &
                 "º, alcanzada el " & Integer'Image(FECHAS(Pos_max).DIA) &
                 " de " &  NOMBRE_MES'Image(FECHAS(Pos_max).MES) &
                 " del anio "  & Integer'Image(FECHAS(Pos_max).ANIO));
      New_Line;
      Put("La temperatura media recogida fue: ");
      New_Line;
      Put_Line(media'Image &
                 "º, alcanzada entre el " & Integer'Image(FECHAS(1).DIA) &
                 " de " &  NOMBRE_MES'Image(FECHAS(1).MES) &
                 " del anio "  & Integer'Image(FECHAS(1).ANIO) &
                 " y el " & Integer'Image(FECHAS(N_tmp).DIA) &
                 " de " &  NOMBRE_MES'Image(FECHAS(N_tmp).MES) &
                 " del anio "  & Integer'Image(FECHAS(N_tmp).ANIO));
   end;
end Main;
