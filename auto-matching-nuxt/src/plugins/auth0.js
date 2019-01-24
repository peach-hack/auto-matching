import Auth0Lock from 'auth0-lock'

const config = {
  clientID: 'dq1NOLYioOI9bMnPg4rOdDJGjgLdNMFy',
  domain: 'auto-matching.auth0.com'
}

class Auth0Util {
  showLock(container) {
    const lock = new Auth0Lock(config.clientID, config.domain, {
      container,
      closable: false,
      auth: {
        responseType: 'token id_token',
        redirectUrl: this.getBaseUrl() + '/callback',
        params: {
          scope: 'openid profile email'
        }
      }
    })
    lock.show()
  }

  getBaseUrl() {
    return `${window.location.protocol}//${window.location.host}`
  }
}

export default (context, inject) => {
  inject('auth0', new Auth0Util())
}
