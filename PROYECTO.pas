program Proyecto;
 uses crt;
  var

   SIoNO,x,y,f,opcion:integer;
   f1,f2,f3,f4,f5,f6,f7:boolean;


    Function Cont_Dig(num : integer) : integer;                                     {Cuenta los digitos de un numero}
   Var cont : integer;
  Begin
    Cont:=0;
      While num > 0 do
       Begin
         num:= num div 10;
         cont:= cont + 1;
       End;

   cont_dig:=cont;
  End;                                                                          {End de Cont_Dig}

Function Modulo(num : integer): integer;                                        {Para obtener 1,2 o 3 numeros de una cifra}
   Var pot,cont : integer;
  Begin
   cont:=cont_dig(num);
    case cont of
     1: pot:=10;
     2: pot:=100;
     3: pot:=1000;
    end;

   modulo:=pot;
  End;                                                                          {End de Modulo}

Function EC(n1,n2 : integer) : boolean;                              {Valida si el numero menor esta contenido en el mayor}
    var pot,aux : integer;
             es : boolean;
   Begin
    pot:= modulo(n2); es:=false;
    Repeat
         aux := n1 mod pot;
            If aux = n2 then
              es:= true;
         n1:=n1 div 10;
    Until((n1 = 0) or (es = true));

     EC:=es;
   End;                                                                         {End de EstaContenido}


Function Voltear(n : integer) : integer;                                        {Voltea un numero}
   var aux : integer;
     Begin
      aux:=0;
       While n > 0 do
         Begin
           aux := aux * 10 + n mod 10;
             n := n div 10;
         End;

        voltear:=aux;
     End;                                                                       {ënd voltear}


Function EI(n1,n2 : Integer) : boolean;                                  {Valida que un numero sea el inverso del otro}
   var  son : boolean;
     Begin
       son:=false;
      If voltear(n2) = n1 then
         son:=true;

       EI:=son;
     End;                                                                       {End de EsInverso}



Function SumaDiv(num : integer) : integer;                                      {Suma los divisores de un numero}
   var suma,i : integer;
     Begin
      suma:=0;
       For i:=1 to num - 1 do
         If (num mod i = 0) then
            suma:=suma + i;

       SumaDiv:=suma;
     End;                                                                       {End de SumaDiv}



Function SA(n1,n2 : Integer) : boolean;                                  {Valida que los numeros sean Amigos}
   var  son : boolean;
     Begin
       son:=false;
      If  (SumaDiv(n1)=n2) or (SumaDiv(n2)=n1) then
         son:=true;

       SA:=son;
     End;                                                                       {End de Amigos}



Function SM(n1,n2 : Integer) : boolean;                               {Valida que los numeros sean multiplos}
   var son : boolean;
     Begin
       son:=false;
       If ((n1 mod n2) = 0) then
         son:=true;

      SM:=son;
     End;                                                                       {End de SonMultiplos}


Function SI(n1,n2 : Integer) : boolean;                               {Valida que los numeros sean iguales}
     var son : boolean;
       Begin
         son:=false;
           If n1 = n2 then
             son:=true;

         SI:=son;
        End;                                                                    {End de SonIguales}



Function SPR(n1,n2:Integer) : boolean;                             {Valida que los numeros sean primos relativos}
   var  i,cont : integer;
           son : boolean;
     Begin
       cont:=0; son:=false;
      For i:=1 to n1 div 2 do
         If ((n1 mod i = 0) and (n2 mod i = 0)) then
           Begin
            cont:=cont +1;
            n1:=n1 div i;
            n2:=n2 div i;
           end;
       If cont = 1 then
          son:=true;

       SPR:=son;
     End;                                                                       {End de SonPrimosRelat}

  procedure menu(n1,n2:integer);
      begin
       f1:= SI(n1,n2);
       if f1=true then
          writeln('los numeros son iguales')
       else
          writeln('los numeros no son iguales');

        f2:= SM(n1,n2);
        if f2=true then
           writeln('los numeros son multiplos')
        else
           writeln('los numeros no son multiplos');

        f4:= SPR(n1,n2);
        if f4=true then
           writeln('los numeros son primos relativos')
        else
           writeln('los numeros no son primos relativos ');

        f5:= EC(n1,n2);
        if f5=true then
           writeln('el numero ',n2,' esta contenido en ',n1)
        else
           writeln('el numero ',n2,' no esta contenido en ',n1);

         f6:= EI(n1,n2);
         if f6=true then
            writeln('el numero ',n2,' es el inverso de: ',n1)
         else
            writeln('el numero ',n2,' no es el inverso de: ',n1);

         f7:= SA(n1,n2);
          if f7=true then
             writeln('los numeros son amigos')
          else
             writeln('los numeros no son amigos');




        readln;
     end;


begin




   repeat
          textbackground(0);
    {gotoXY;}clrscr;
     textcolor(14);
    {gotoXY;}writeln('|               ');
    {gotoXY;}writeln('|               ');
    {gotoXY;}writeln('|               ');
    {gotoXY;}writeln('|               ');
    {gotoXY;}writeln('|               ');
    {gotoXY;}writeln('|                                                  ');
    {gotoXY;}writeln('|                                                  ');
    {gotoXY;}writeln('|                                                  ');
    {gotoXY;}writeln('|                                                  ');
    {gotoXY;}writeln('|                                                  ');
    Clrscr;
    readkey;
       Writeln('¿Que opcion desea?');
       Writeln('1: Procedimientos automantico');
       Writeln('2: Ejecutar cada funcion por separado');
       readln(Opcion);

         {agregue esta validacion para ya tener todo en este archivo del proyecto}
        if (x<0) or (y<0) then
           writeln('Error los valores deben de ser mayores o iguales a cero');

         if IOResult <> 0 then                    {valida si el usuario mete un caracter}
           WriteLn('Valor Inválido')
         else
           WriteLn('Valor permitido');



        if opcion=1 then
         Writeln('ingrese valor x');
         readln(x);
         writeln('ingrese valor y');
         readln(y);
         menu(x,y);

      writeln('desea volver a ingresar valores? SI=1 , NO=0');
      readln(SIoNO);
  until SIoNO=0;
  readkey;
end.
