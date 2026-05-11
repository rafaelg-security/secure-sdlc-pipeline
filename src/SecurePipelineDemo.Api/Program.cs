var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => Results.Ok(new
{
    message = "Secure SDLC Pipeline Demo API",
    framework = ".NET 10",
    status = "running"
}));

app.Run();
