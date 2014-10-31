module Sync(
input wire clk,
input wire clr,
output reg [9:0] h,    // posicion horizontal 0 a 639
output reg [9:0] v,    // posicion vertical  0 a 479
output reg hsync, 	   // pulso de sincronizacion horizontal
output reg vsync, 	   // pulso de sincronizacion vertical
output reg von,		   // señal que habilita la salida del video
output reg refresh
);

reg[9:0]hc,vc;	// contadores auxiliares para considerar las señales dummy de sincronizacion.
reg venable;	// permite llevar registo de cuando se cuenta en una linea

//  -------------------------------
//    Inicializacion de registros
//  -------------------------------
initial 	
begin 
	hc=0;
	vc=0;
	h=0;
	v=0;
	hsync=0;
	vsync=0;
	von=0;
end
			
//  -------------------------------
//    Parametros de sincronizacion
//  -------------------------------
/*
 Extraidos desde: http://martin.hinner.info/vga/
 */
parameter h_px	= 	800;	// 800 pixeles, largo total de cada fila
parameter v_ln	= 	524;	// 521 lineas, cantidad total de las filas
parameter BP_h	=   144;	// px al que termina el Back porch horizontal. Calculado como sp+bp=(96+48)=144
parameter FP_h	=	784;	// px al que empieza el front porch horizontal. Calculado como sp+bp+av=(144+640)=784
parameter BP_v	=	33;	    // fila donde que termina el Back Porch vertical. Calculado como sp+bp= (31+2)= 33
parameter FP_v	=	513;	// fila donde empieza el front porch vertical. sb+bp+av=511

// -----------------------------
//    contador horizontal
// -----------------------------
/* 
hc lleva el registro global (0 a 799) .
h el registro de la region de video (0 a 639).
h empieza a crecer solo cuando hc>sp+bp.
*/
always@(posedge clk, posedge clr)
	begin
	if(clr==1)		//si clr == 1, reseteamos el contador
		begin
		hc<=0;
		h<=0;
		end
	else
	begin 
		if(hc == h_px-1)		//si llegamos al final resetamos el contador y contamos una linea
			begin
			hc	<=0;
			h<=0;
			venable <=1;
			end
		else						//caso contrario contamos.
			begin	
				hc<=hc+1;		
				if(hc>BP_h && hc<FP_h) h<=h+1; // si estamos en la region de video aumentamos en 1 el contador de pixeles.
				venable<=0;
			end
	end
	end
	
// ------------------------
//   pulsos horizontales
// ------------------------
/* 
hsync debe ser 0 en la region de sp (hc de 0 a 96)
*/
always@(*)
begin
	if(hc<(96)) hsync= 0;
	else hsync= 1;
end
	
// ------------------------
//   contador Vertical
// ------------------------
/*
análogo al caso anterior. 
vc  (0  a 523).
v  (0 a 439).
la cuenta solo se activa si venable es 1 (terminamos una fila).
*/

always@(posedge clk)
begin
	if(venable==1)
	begin
		if(vc == v_ln-1)
		begin
			vc<=0;
			v<=0;
		end
		else 
		begin
			vc<=vc+1;
			if(vc>BP_v&&vc<FP_v) v<=v+1;
		end
	end
end
	
// ------------------------------------	
//   generador de puslso horizontales 
// ------------------------------------
/*
vsync debe ser o durante sp (vc= 0 a 2).
*/
always@(*)
begin 
	if(vc<2)
		vsync=0;
	else
		vsync=1;
end

// ------------------------
//   Enable de video
// ------------------------
/*
habilitamos la salida de señales de video
cuando nos encontramos en las regiones de video active. 
*/
always@(*)
begin
	if((hc<FP_h)&&(hc>BP_h)&&( vc<FP_v)&&(vc>BP_v))
		von=1;
	else
		von=0;
end

// --------------------------
//   Señal de refresh	
// --------------------------
/*
Genera un puslo util para refrescar los objetos de la pantalla.
Se activa a una frecuencia de 25/(480x640) MHz = 81.38Hz y dura 4us.
*/
always@(*)
begin
	if((h==1)&&(v==1))
	refresh=1;
	else
	refresh=0;
end
	
endmodule
