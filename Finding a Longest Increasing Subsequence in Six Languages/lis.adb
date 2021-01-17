with ADA.Text_IO; with ADA.Integer_Text_IO; use ADA.Text_IO; use Ada.Integer_Text_IO;

PROCEDURE lis IS

TYPE to_search IS ARRAY(Positive RANGE <>) OF Integer;


FUNCTION BinarySearch(Slice: to_search; Res: to_search; Target: Integer) RETURN Natural IS
	Middle : Natural;
BEGIN
	Middle := (Slice'First + Slice'Last)/2;

	IF Slice'Length = 0 THEN
		RETURN Slice'First;
	ELSIF Res(Slice(Middle)) >= Target THEN
		RETURN BinarySearch (Slice(Slice'First..Middle-1), Res, Target);
	ELSIF Res(Slice(Middle)) < Target THEN
		RETURN BinarySearch (Slice(Middle+1..Slice'Last), Res, Target);
	ELSE
		RETURN Middle;
	END IF;
END BinarySearch;





FUNCTION Get_Ints RETURN to_search IS
	Value: Integer;
BEGIN
	GET(Value);
	RETURN to_search'(1 => Value) & Get_Ints;

EXCEPTION
	WHEN OTHERS =>
		RETURN Empty : to_search(1..0);
END Get_Ints;



FUNCTION Get_Ints_Helper RETURN to_search IS
BEGIN
	Put_Line("Hello. This program outputs a largest strictly increasing subsequence from a given array using a O(nlogn) dynamic programming algorithm. Please input a list of integers by seperating the elements with spaces and typing ""$"" (EOF) when done. (For example, ""1 2 3 4$"" is valid.)");

	RETURN Get_Ints;
END Get_Ints_Helper;



Result : to_search := Get_Ints_Helper;
Len : Integer;
Tail_Table : to_search(1..Result'Last);
Recovery_Table : to_search(1..Result'Last); -- store last best value.
Temp : Integer;
Count : Integer;

BEGIN
	

	FOR I IN 1..Tail_Table'Last LOOP
		Tail_Table(I) := 1;
	END LOOP;

	FOR I IN 1..Recovery_Table'Last LOOP
		Recovery_Table(I) := -1;
	END LOOP;

	--Put_Line(Integer'Image(Result'Length));
	--FOR E OF Result LOOP
	--	Put(Integer'Image(E));
	--END LOOP;
	Len := 2;
	--Recovery_Table(1) := 0;


	FOR I IN 2..Result'Last LOOP
		IF Result(I) = Result(I-1) THEN
			GOTO Jump_to_End;
		END IF;


		IF Result(I) < Result(Tail_Table(1)) THEN
			Tail_Table(1) := I;
		ELSIF Result(I) > Result(Tail_Table(Len - 1)) THEN
			Recovery_Table(I) := Tail_Table(Len-1);
			Tail_Table(len) := I;
			Len := Len + 1;
		ELSE
			Temp := BinarySearch(Tail_Table(Tail_Table'First+1..Len-1), Result, Result(I));
			Recovery_Table(I) := Tail_Table(Temp-1);
			Tail_Table(Temp) := I;

		END IF;

		<<Jump_to_End>>

	END LOOP;



	--FOR K OF Recovery_Table LOOP
	--	Put(Integer'Image(k));
	--END LOOP;
	--Put_Line(Integer'Image(Len-1));

	Temp := Tail_Table(Len-1);

	Count := 1;

	WHILE Temp >= 0 LOOP
		Count := Count + 1;
		Temp := Recovery_Table(Temp);
	END LOOP;

	Count := Count - 1;

	DECLARE
		Answer: to_search(1..Count);

	BEGIN
		Temp := Tail_Table(Len-1);
		WHILE Count >= 1 LOOP
			Answer(Count) := Temp;
			Temp := Recovery_Table(Temp);
			Count := Count - 1;
		END LOOP;

		FOR E OF Answer LOOP
			Put(Integer'Image(Result(E)));
		END LOOP;
	END;

	
END lis;

