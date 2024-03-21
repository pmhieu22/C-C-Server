// [ Client Dashboard  ]
exports.client_dashboard = function (req, res) {
  console.log(
    "Admin GET: Client Dashboard (Client:".cyan +
      req.params["id"] +
      ") : ".cyan +
      req.mySession.admin_info[0].admin_pseudo
  );

  sql_login_verif =
    "SELECT * FROM t_clients WHERE client_id = " +
    db.escape(req.params["id"]) +
    "";
  db.query(sql_login_verif, function (err, rows, fields) {
    var client = rows;
    res.render("app/home", {
      title: "Client Dashboard",
      section: "client_dashboard",
      admin: req.mySession.admin_info[0],
      client: client[0],
    });
  });
};
exports.client_listing = function (req, res) {
  console.log(
    "Admin GET: Home - Client listing: ".cyan +
      req.params["id"] +
      ") : ".cyan +
      req.mySession.admin_info[0].admin_pseudo
  );
  sql_client_list =
    "SELECT * FROM t_clients WHERE cluster_id =" + req.params["id"];
  db.query(sql_client_list, function (err, rows, fields) {
    var clients = rows;

    sql_console_log = "SELECT * FROM t_logs ORDER BY log_id DESC LIMIT 10;";
    db.query(sql_console_log, function (err, rows, fields) {
      var logs = rows;
      res.render("app/home", {
        title: "Home - Client listing",
        section: "client_listing",
        admin: req.mySession.admin_info[0],
        clients: clients,
        logs: logs,
      });
    });
  });
};

// [ Client Dashboard POST update ]
exports.client_dashboard_post = function (req, res) {
  db.query(
    "UPDATE t_clients " +
      "SET  " +
      "client_active = " +
      db.escape(req.body.active) +
      " " +
      "WHERE client_id = " +
      db.escape(req.params["id"]) +
      ";"
  );

  res.redirect("/client_dashboard/" + req.params["id"]);
};

// [ Client Dashboard delete ]
exports.client_dashboard_delete = function (req, res) {
  db.query(
    "DELETE FROM t_clients WHERE client_id = " +
      db.escape(req.params["id"]) +
      ";"
  );
  res.redirect("/home");
};

// [ Dashboard  ]
exports.client_remote_shell = function (req, res) {
  console.log(
    "Admin GET: Client Remote Shell (Client:".cyan +
      req.params["id"] +
      ") : ".cyan +
      req.mySession.admin_info[0].admin_pseudo
  );

  sql_login_verif =
    "SELECT * FROM t_clients WHERE client_id = " +
    db.escape(req.params["id"]) +
    "";
  db.query(sql_login_verif, function (err, rows, fields) {
    var client = rows;
    res.render("app/home", {
      title: "Client Remote Shell",
      section: "client_remote_shell",
      admin: req.mySession.admin_info[0],
      client: client[0],
    });
  });
};
