using System.Text.Json;
using StackExchange.Redis;

ConnectionMultiplexer redis = ConnectionMultiplexer.Connect("localhost");
IDatabase db = redis.GetDatabase();

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapGet("/", () => new { message = "Hello World!"});

var count = 0;
app.MapPost("/contacts", async (HttpContext context) => 
{
    using var reader = new StreamReader(context.Request.Body);
    var reqBody = await reader.ReadToEndAsync();

    try 
    {
        var json = JsonDocument.Parse(reqBody).RootElement;
        json.TryGetProperty("tel", out var tel);
        var key = $"tel{count}";
        count++;
        var phone = tel.GetString();

        if (json.ValueKind != JsonValueKind.Undefined) 
        {
            db.HashSet("contacts", key, phone);
        }

        context.Response.StatusCode = StatusCodes.Status200OK;
        await context.Response.WriteAsync($"Telefone: {phone} cadastrado com a key: {key}.");
    } catch (JsonException ex)
    {
        context.Response.StatusCode = StatusCodes.Status400BadRequest;
        await context.Response.WriteAsync("Erro ao cadastrar telefone: " + ex.Message);
    }
});

app.UseHttpsRedirection();
app.Run();
