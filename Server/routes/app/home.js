// [ Clients listing ]

exports.home = function(req, res){

	console.log("Admin GET: Home - Client listing: ".cyan + req.mySession.admin_info[0].admin_pseudo);
	sql_client_list = "SELECT * FROM t_clusters ";
	db.query(sql_client_list, function(err, rows, fields) {
		var clusters = rows;

		sql_console_log = "SELECT * FROM t_logs ORDER BY log_id DESC LIMIT 10;";
		db.query(sql_console_log, function(err, rows, fields) {
			var logs = rows;

			res.render('app/home', {
				title    : 'Home - Cluter listing',
		        section : 'cluster_listing',
		        admin   : req.mySession.admin_info[0],
						clusters : clusters,
						logs    : logs
						
			});

		});

	});

};

// [ CLient dashboard ]
exports.home_post = function(req, res){

	console.log(req.body);

	db.query("INSERT INTO t_clusters (client_serial,client_key, cluster_active) "+
						"VALUES ("+db.escape(req.body.serial)+", "+
						        ""+db.escape(req.body.key)+", "+
						        "'1');");

	res.redirect('/home');

};
