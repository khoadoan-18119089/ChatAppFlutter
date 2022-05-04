const NotImplementedError = require('./notImplementedError');

class BaseAdaptor {
  static connect () {
    throw new NotImplementedError('connect method not implemented');
  }

  static disconnect () {
    throw new NotImplementedError('disconnect method not implemented');
  }

  static findById () {
    throw new NotImplementedError('findById method not implemented');
  }

  static find () {
    throw new NotImplementedError('find method not implemented');
  }

  static findOne () {
    throw new NotImplementedError('findOne method not implemented');
  }

  static save () {
    throw new NotImplementedError('save method not implemented');
  }

  static count () {
    throw new NotImplementedError('count method not implemented');
  }

  static distinct () {
    throw new NotImplementedError('distinct method not implemented');
  }

  static delete () {
    throw new NotImplementedError('delete method not implemented');
  }

  static deleteDatabase () {
    throw new NotImplementedError('deleteDatabase method not implemented');
  }

  static createDatabase () {
    throw new NotImplementedError('createDatabase method not implemented');
  }

  static addColumn () {
    throw new NotImplementedError('addColumn method not implemented');
  }

  static createIndex () {
    throw new NotImplementedError('createIndex method not implemented');
  }

  static getIndexes () {
    throw new NotImplementedError('getIndexes method not implemented');
  }

  static renameColumn () {
    throw new NotImplementedError('renameColumn method not implemented');
  }

  static deleteColumn () {
    throw new NotImplementedError('deleteColumn method not implemented');
  }

  static listDatabases () {
    throw new NotImplementedError('listDatabases method not implemented');
  }
}

module.exports = BaseAdaptor;
