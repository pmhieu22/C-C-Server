exports.user_listing = function(req, res){

	console.log("Admin GET: Home - User listing: ".cyan+req.params['id']+") : ".cyan + req.mySession.admin_info[0].admin_pseudo);
	sql_user_list = "SELECT * FROM t_admins;";
	db.query(sql_user_list, function(err, rows, fields) {
		var users = rows;

		sql_console_log = "SELECT * FROM t_logs ORDER BY log_id DESC LIMIT 10;";
		db.query(sql_console_log, function(err, rows, fields) {
			var logs = rows;
			res.render('app/home', {
				title    : 'Home - Client listing',
		        section : 'user_listing',
		        admin   : req.mySession.admin_info[0],
						users : users,
						logs    : logs
						
			});

		});

	});

};

// [ User dashboard ]
exports.user_post = function(req, res){

	console.log(req.body);

	db.query("INSERT INTO t_admins (admin_pseudo,admin_mail, admin_password,admin_lvl, admin_active) "+
						"VALUES ("+db.escape(req.body.fullname)+", "+
						        ""+db.escape(req.body.admin_mail)+", "+
                                ""+db.escape(req.body.admin_password)+", "+
                                "'10'" +", "+
						        "'1');");

	res.redirect('/user');

};
