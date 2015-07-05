var s;
var num;
var f = [];
process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(chunk) {
	var lines = chunk.toString().split('\n');
	s = lines.shift();
	num = lines.shift();
	for(var i=0; i<num; i++) {
		f.push(parseInt(lines[i]));
	}
	f.sort(function(a,b){return b - a;});
});
process.stdin.on('end', function() {
	var found = 0;
	var l = 0;
	var fl = f[l];
	while ( fl * 3 >= s ){
		var s2 = s - fl;
		var m = l +1;
		var n = num - 1;
		var fm = f[m];
		var fn = f[n];
		while ( m < n ) {
			var ss = fm + fn;
			if ( ss >= s2 ) {
				if ( ss == s2 ){
					found++;
				}
				m++;
				fm = f[m];
			}else{
				n--;
				fn = f[n];
			}
		}
		l++;
		fl = f[l];

	}
	console.log(found);
});

