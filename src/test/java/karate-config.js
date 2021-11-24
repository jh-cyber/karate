function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
 apiUrl: 'https://www.test-insurance.com/api/v1'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
 var accessToken = karate.callSingle('TokenGenerator.feature', config).token
 karate.configure('headers', {Authorization: 'Bearer ' + accessToken})
  return config;
}