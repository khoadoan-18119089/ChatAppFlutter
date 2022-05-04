class NotImplementedError extends Error {
  constructor (...params) {
    super(...params);

    this.name = 'NotImplementedError';
  }
}

module.exports = NotImplementedError;
