const controller  = {};

controller.list = (req, res) =>{
    req.getConnection((err, conn) =>{
        conn.query('SELECT * FROM employed' , (err , employees ) => {
            if(err){
                res.json(err);
            }
            res.render('employees',{
                data: employees
            });
    });
});
};

controller.save = (req, res) =>{
    const data = req.body
    req.getConnection((err, conn) => {
        conn.query('INSERT INTO employed set ?' , [data] , (err, employee) => {
            res.redirect('/');
        });
    })
};
controller.edit = (req, res) => {
    const { id } = req.params;
    req.getConnection( (err , conn) => {
        conn.query('SELECT * FROM employed WHERE id = ?' , [id] , (err, employee) => {
            res.render('employees_edit' , {
                data: employee[0]
            })
        });
    });
};
controller.update = (req, res) => {
    const { id } = req.params;
    const newEmployee = req.body;
    req.getConnection( (err,conn) => {
        conn.query('UPDATE employed set ? WHERE id = ?' , [newEmployee , id] , (err, rows) =>{
            res.redirect('/');
        });
    });
};
controller.delete = (req, res) =>{
    const { id } = req.params; 
    req.getConnection( (err, conn) => {
        conn.query('DELETE FROM employed WHERE id = ?' , [id] , (err, rows) => {
            res.redirect('/');
        });
    });
}

module.exports = controller;