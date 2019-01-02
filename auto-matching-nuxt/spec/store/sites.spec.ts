import { sites } from '../../src/store/sites'

describe('sites', () => {
  describe('mutations', () => {
    describe('addSite', () => {
      it('adds a site to the state', () => {
        const site = {}
        const state = {
          sites: []
        }

        sites.mutations.addSites(state, [{ site }])

        expect(state).toEqual({
          sites: []
        })
      })
    })
  })
})
