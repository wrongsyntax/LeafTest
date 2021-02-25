import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        "It works!"
    }

    app.get("leaf") { req in
        req.view.render("index", ["title": "Hello Vapor!"])
    }


    // Struct for the name retrieved from URL query string
    // This is a Content struct for use in the app.get request
    struct Hello: Content {
        var name: String?
    }

    app.get("hello") { req -> EventLoopFuture<View> in
        let hello = try req.query.decode(Hello.self)
        let greeting = "Hello, \(hello.name ?? "anonymous visitor")"
        print("Greeting the visitor. Name given is \(hello.name ?? "[not given]")")
        return req.view.render("index", ["title": "Greetings", "hello": greeting])
    }
}
