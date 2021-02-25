import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // Set port to 1227
    app.http.server.configuration.port = 1227

    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

/*
    if !app.environment.isRelease {
        LeafRenderer.Option.caching = .bypass
    }
*/
    // This tells Vapor to use the LeafRenderer when you call req.view in your code.
    app.views.use(.leaf)

    // register routes
    try routes(app)
}