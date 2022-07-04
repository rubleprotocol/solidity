contract C {
	struct S { uint a; uint b; }
	S x; S y;
	function f() public {
		(x, y) = (y, x);
	}
	function g() public {
		uint z;
		((x, y), z) = ((y, x), 0);
	}
}
// ----
// Warning 7238: (79-94): This assignment performs two copies to storage. Since storage copies do not first copy to a temporary location, one of them might be overwritten before the second is executed and thus may have unexpected effects. It is safer to perform the copies separately or assign to storage pointers first.
// Warning 7238: (134-159): This assignment performs two copies to storage. Since storage copies do not first copy to a temporary location, one of them might be overwritten before the second is executed and thus may have unexpected effects. It is safer to perform the copies separately or assign to storage pointers first.
