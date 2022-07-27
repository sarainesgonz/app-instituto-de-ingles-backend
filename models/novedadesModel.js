var pool = require('./bd');

//traer novedades
async function getNovedades() {
    var query = 'select * from novedades order by id DESC';
    var rows = await pool.query(query);
    return rows;
}

//insertar novedades
async function insertNovedad(obj) {
    try {
        var query = "insert into novedades set ?";
        var rows = await pool.query(query, [obj])
        return rows;
    } catch (error) { //usar trry catch ya que es un punto critico 
        console.log(error);
        throw error;
    }
}

//eliminar novedades
async function deleteNovedadesById(id) {
    var query = "delete from novedades where id = ? ";
    var rows = await pool.query(query, [id]);
    return rows;
}

//traer la novedad a modificar
async function getNovedadById(id) {
    var query = "select * from novedades where id = ?";
    var rows = await pool.query(query, [id]);
    return rows[0];
}

//update de la novedad ya modificada
async function modificarNovedadById(obj, id) {
    try {
        var query = "update novedades set ? where id = ?";
        var rows = await pool.query(query, [obj, id]);
        return rows;
    } catch (error) {
        throw error;
    }
}

module.exports = { getNovedades, insertNovedad, deleteNovedadesById, getNovedadById, modificarNovedadById }