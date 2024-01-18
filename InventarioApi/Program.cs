using CoreInventario.Interface;
using Infraestructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Persistance;
using Persistance.Data;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("Inventario");

builder.Services.AddDbContext<InventarioContext>(options =>
    options.UseSqlServer(connectionString));

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTransient<IUsuarioRepository, UsuarioRepository>();
builder.Services.AddTransient<ISalidaRepository, SalidaRepository>();

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: "InventarioPolicy",
                      policy =>
                      {
                          policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
                      });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("InventarioPolicy");

app.UseAuthorization();

app.MapControllers();

app.Run();
