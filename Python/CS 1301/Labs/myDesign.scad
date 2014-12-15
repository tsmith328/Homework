//Tyler Smith
//Section A06
//I worked on this model alone, using only this semester's materials.
//It's a table!!!!!!!!

//Sizing variables (change h(eight) and r(adius) to resize object
$fn = 60;
h = 100;
rad = 100;
tThick = h / 20;
wide = 25;

//Top of table
module tableTop(radius, thickness) {
	translate([0,0,tThick/2]){
		cylinder(r1 = radius, r2 = radius - (radius / 10), h = thickness, center=true);}
};

//Table base
module tableBase(width,height) {
		for (z= [tThick:height]){
			rotate([0,0,z]) {
				translate([0,0,z]) {
					cube([width,width,1],center=true);}
}
}
		for (z= [tThick:height]){
			rotate([0,0,-z]) {
				translate([0,0,z]) {
					cube([width,width,1],center=true);}
}
}
};

module table(radius,thickness,width,height) {
	union(){tableBase(width,height);
	tableTop(radius,thickness);}}

table(rad,tThick,wide,h);



