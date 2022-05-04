const BaseAdaptor = require('./index');
const NotImplementedError = require('./notImplementedError');

describe("BaseAdaptor class", () => {
  test('connect method should throw NotImplementedError', () => {
    expect(BaseAdaptor.connect).toThrow(new NotImplementedError('connect method not implemented'));
  });

  test('disconnect method should throw NotImplementedError', () => {
    expect(BaseAdaptor.disconnect).toThrow(new NotImplementedError('disconnect method not implemented'));
  });

  test('findById method should throw NotImplementedError', () => {
    expect(BaseAdaptor.findById).toThrow(new NotImplementedError('findById method not implemented'));
  });

  test('find method should throw NotImplementedError', () => {
    expect(BaseAdaptor.find).toThrow(new NotImplementedError('find method not implemented'));
  })

  test('findOne method should throw NotImplementedError', () => {
    expect(BaseAdaptor.findOne).toThrow(new NotImplementedError('findOne method not implemented'));
  });

  test('save method should throw NotImplementedError', () => {
    expect(BaseAdaptor.save).toThrow(new NotImplementedError('save method not implemented'));
  });

  test('count method should throw NotImplementedError', () => {
    expect(BaseAdaptor.count).toThrow(new NotImplementedError('count method not implemented'));
  });

  test('distinct method should throw NotImplementedError', () => {
    expect(BaseAdaptor.distinct).toThrow(new NotImplementedError('distinct method not implemented'));
  });

  test('delete method should throw NotImplementedError', () => {
    expect(BaseAdaptor.delete).toThrow(new NotImplementedError('delete method not implemented'));
  });

  test('deleteDatabase method should throw NotImplementedError', () => {
    expect(BaseAdaptor.deleteDatabase).toThrow(new NotImplementedError('deleteDatabase method not implemented'));
  });

  test('createDatabase method should throw NotImplementedError', () => {
    expect(BaseAdaptor.createDatabase).toThrow(new NotImplementedError('createDatabase method not implemented'));
  });

  test('addColumn method should throw NotImplementedError', () => {
    expect(BaseAdaptor.addColumn).toThrow(new NotImplementedError('addColumn method not implemented'));
  });

  test('createIndex method should throw NotImplementedError', () => {
    expect(BaseAdaptor.createIndex).toThrow(new NotImplementedError('createIndex method not implemented'));
  });

  test('getIndexes method should throw NotImplementedError', () => {
    expect(BaseAdaptor.getIndexes).toThrow(new NotImplementedError('getIndexes method not implemented'));
  });

  test('renameColumn method should throw NotImplementedError', () => {
    expect(BaseAdaptor.renameColumn).toThrow(new NotImplementedError('renameColumn method not implemented'));
  });

  test('deleteColumn method should throw NotImplementedError', () => {
    expect(BaseAdaptor.deleteColumn).toThrow(new NotImplementedError('deleteColumn method not implemented'));
  });

  test('listDatabases method should throw NotImplementedError', () => {
    expect(BaseAdaptor.listDatabases).toThrow(new NotImplementedError('listDatabases method not implemented'));
  });
});
