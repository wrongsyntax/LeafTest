import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // This tells Vapor to use the LeafRenderer when you call req.view in your code.
    app.views.use(.leaf)

    // register routes
    try routes(app)
}
