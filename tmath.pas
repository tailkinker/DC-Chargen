{
Unit tmath - a unit to add a few handy math functions to Free Pascal.

Created 31 July 2004 by Timothy Red Groves
Revised 10 September 2004:  Added sig.
Revised 14 September 2004:  Added log2 and comments.  Also changed all real
	types to double-precision floating-point.
Revised 19 September 2011:  Added dec2hex, hex2dec, dec2bin, bin2dec.
Revised 08 January 2012:  Added ellipsoid_sa and normdist.
Revised 10 July 2013 : Added dtor (degrees to radians).

Revision 1.00.005
}



unit tmath;

	interface

		const
			precision : byte = 8; // Bits

		function pwr (x, y : double) : double;
		function log (x : double) : double;
		function log2 (x : double) : double;
		function ceil (x : double) : longint;
		function sig (x : double; digits : integer) : double;
		function dec2hex (x : longint) : string;
		function hex2dec (x : string) : longint;
		function dec2bin (x : longint) : string;
		function bin2dec (x : string) : longint;		
		function ellipsoid_sa (ax, ay, az : double) : double;
		function normdist(x, mean, sd : double) : double;
		function dtor (degrees : double) : double;
		
		
	implementation

		function pwr (x, y : double) : double;
			{
			Raises x to the power of y.
			}
			begin
				pwr := exp (ln (x) * y)
			end;



		function log (x : double) : double;

			{
			Finds the base-10 log of x.
			}

			begin
				log := ln (x) / ln (10);
			end;



		function log2 (x : double) : double;

			{
			Finds the base-2 log of x.  Also called the k number.
			}

			begin
				log2 := ln (x) / ln (2);
			end;



		function ceil (x : double) : longint;

			{
			Finds the smallest integer larger than x.  Also known as rounding 
			up.
			}

			begin
				if (trunc (x) = x) then
					ceil := trunc (x)
				else
					ceil := trunc (x + 1);
			end;



		function sig (x : double; digits : integer) : double;

			{
			Rounds x to the nearest significant digits.
			}

			var
				p : double;

			begin
				p := pwr (10, trunc(log (x)) - (digits - 1));
				sig := round (x / p) * p;
			end;



		function dec2hex (x : longint) : string;
		
		
			{
			Converts x to a string representation of x expressed in 
			hexidecimal.
			}
			
			var
				t : string;
				y : byte;

			begin
				t := '';
				while (x > 0) do
					begin
						y := x mod 16; // Extract the LSN from x
						if (y > 9) then
							t := chr (y + 55) + t // A..F
						else
							t := chr (y + 48) + t; // 0..9
						x := x div 16;  // Remove the LSN from x
					end;

				while ((length (t) mod (precision div 4)) <> 0) do
					t := '0' + t;  // Pad to required precision

				dec2hex := t;
			end;



		function hex2dec (x : string) : longint;

			{
			Converts x, a string representation of a hexidecimal number, to a 
			long integer.
			}

			var
				i : byte;
				y : longint;
				c : char;

			begin
				y := 0;
				i := 1;

				while (i <= length (x)) do
					begin
						c := UpCase (x [i]);
						if (c in ['0'..'9']) then
							y := (y shl 4) + (ord (c) - 48)
						else
							if (c in ['A'..'F']) then
								y := (y shl 4) + (ord (c) - 55);
						inc (i);
					end;

				hex2dec := y;
			end;
		
		
	
		function dec2bin (x : longint) : string;
		
			{
			Converts x to a string representation of x expressed in binary.
			}
			
			var
				t : string;

			begin
				t := '';
				while (x > 0) do
					begin
						if ((x mod 2) = 1) then  // Check LSB 
							t := '1' + t
						else
							t := '0' + t;
						x := x shr 1; // Clear LSB
					end;

				while ((length (t) mod precision) <> 0) do
					t := '0' + t;  // Pad to required precision		
				
				dec2bin := t;		
			end;
		
		
		
		function bin2dec (x : string) : longint;		

			{
			Converts x, a string representation of a binary number, to a long 
			integer.
			}

			var
				i : byte;
				y : longint;
				c : char;

			begin
				y := 0;
				i := 1;

				while (i <= length (x)) do
					begin
						c := UpCase (x [i]);
						if (c = '0') then
							y := (y shl 1)
						else
							y := (y shl 1) + 1;
						inc (i);
					end;

				bin2dec := y;
			end;



		function ellipsoid_sa (ax, ay, az : double) : double;

			{
			Approximates the surface area of an ellipsoid with radii 
			(ax, ay, ax).
			}
			const
				P = 1.6075;

			begin
				ellipsoid_sa := 4 * pi * pwr(((
					(pwr (ax, P) * pwr (ay, P)) +
					(pwr (ax, P) * pwr (az, P)) +
					(pwr (ay, P) * pwr (az, P))
					) / 3), 1/P);
			end;



		function normdist(x, mean, sd : double) : double;  

			{
			Calculates the normal distribution z-score, given the data point 
			(x), mean and standard deviation.
			
			Black magic.  Treat it like a sore dick.
			}
			var
				res : double = 0;
				x2 : double = 0;
				oor2pi : double = 0;
				t : double = 0;

			begin
				x2 := (x - mean) / sd;
				if (x2 = 0) then
					res := 0.5
				else
				begin
					oor2pi := 1 / sqrt (2 * pi);
					t := 1 / (1 + 0.2316419 * abs (x2));
					t := t * oor2pi * exp(-0.5 * x2 * x2)
						* (0.31938153   + t 
						* (-0.356563782 + t
						* (1.781477937  + t 
						* (-1.821255978 + t * 1.330274429))));
					if (x2 >= 0) then
						res := 1 - t
					else
						res := t;
				end;
				// I wish I knew what all that meant.
				
				normdist := res
			end;

		function dtor (degrees : double) : double;
    // Converts from degrees to radians
    begin
      while (degrees < 0) do
        degrees += 360;
    	while (degrees >= 360) do
        degrees -= 360;
      dtor := degrees / 180 * pi;
    end;

	end.
