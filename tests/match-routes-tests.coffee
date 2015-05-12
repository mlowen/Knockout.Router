describe 'Knockout single page router route matching', () ->
	router = null

	beforeAll () ->
		router = new KnockoutSinglePageRouter [
			{
				name: 'default'
				url: '/'
			}
			{
				name: 'single'
				url: '/foo'
			}
			{
				name: 'multi'
				url: '/foo/bar'
			}
			{
				name: 'parameter'
				url: '/foo/:id'
			}
			{
				name: 'multiparameters'
				url: '/foo/:foo/bar/:bar'
			}
		]

	beforeEach () -> router.current null

	# Route Matching

	## Default

	it 'matches the default route', () ->
		router.go '/'
		expect(router.current().component).toBe('default')

	it 'matches the default route with a query string', () ->
		router.go '/?foo=bar'
		expect(router.current().component).toBe('default')

	it 'matches the default route with a hash', () ->
		router.go '/#hash'
		expect(router.current().component).toBe('default')

	it 'matches the default route with a hash and a query string', () ->
		router.go '/#hash?foo=bar'
		expect(router.current().component).toBe('default')

	## Single component

	it 'matches a single component route', () ->
		router.go '/foo'
		expect(router.current().component).toBe('single')

	it 'matches a single component route with a query string', () ->
		router.go '/foo?foo=bar'
		expect(router.current().component).toBe('single')

	it 'matches a single component route with a hash', () ->
		router.go '/foo#hash'
		expect(router.current().component).toBe('single')

	it 'matches a single component route with a hash and a query string', () ->
		router.go '/foo#hash?foo=bar'
		expect(router.current().component).toBe('single')

	## Multiple components

	it 'matches a multi component route', () ->
		router.go '/foo/bar'
		expect(router.current().component).toBe('multi')

	it 'matches a multi component route with a query string', () ->
		router.go '/foo/bar?foo=bar'
		expect(router.current().component).toBe('multi')

	it 'matches a multi component matches the default route with a hash', () ->
		router.go '/foo/bar#hash'
		expect(router.current().component).toBe('multi')

	it 'matches a multi component matches the default route with a hash and a query string', () ->
		router.go '/foo/bar#hash?foo=bar'
		expect(router.current().component).toBe('multi')

	## Single parameter

	it 'matches a route with a parameter', () -> expect(true).toBe(false)
	it 'matches a route with a parameter and a query string', () -> expect(true).toBe(false)
	it 'matches a route with a parameter and a hash', () -> expect(true).toBe(false)
	it 'matches a route with a parameter and a hash and a query string', () -> expect(true).toBe(false)

	## Multiple parameters

	it 'matches a route with multiple parameters', () -> expect(true).toBe(false)
	it 'matches a route with multiple parameters and a query string', () -> expect(true).toBe(false)
	it 'matches a route with multiple parameters and a hash', () -> expect(true).toBe(false)
	it 'matches a route with a parameter and a hash and a query string', () -> expect(true).toBe(false)

	## Unknown route

	it 'sets current to null if unable to match a route', () ->
		router.go '/unknown'
		expect(router.current()).toBe(null)

	# Hash extraction

	it 'extracts the hash into a property of the current route', () -> expect(true).toBe(false)
	it 'sets the hash property to be null when there is no hash in the URL', () -> expect(true).toBe(false)

	# Query string extraction

	it 'extracts a query parameter into the query object of the current route', () -> expect(true).toBe(false)
	it 'extracts a query parameter into the query object of the current route when there is also a hash', () -> expect(true).toBe(false)
	it 'extracts multiple query parameters into the query object of the current route', () -> expect(true).toBe(false)
	it 'extracts multiple query parameters of the same name into an array on the query object of the current route', () -> expect(true).toBe(false)
	it 'extracts multiple query parameters with a mix of distinct and multiple of the same name into the query object of the current route', () -> expect(true).toBe(false)
