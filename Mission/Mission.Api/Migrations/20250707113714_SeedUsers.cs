using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Mission.Api.Migrations
{
    /// <inheritdoc />
    public partial class SeedUsers : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "User",
                columns: new[] { "id", "CreatedDate", "email_address", "first_name", "IsDeleted", "last_name", "ModifiedDate", "password", "phone_number", "user_image", "user_type" },
                values: new object[] { 2, new DateTime(2020, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc), "user@tatvasoft.com", "Niken", false, "Patel", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "User@123", "9876500000", "", "user" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "User",
                keyColumn: "id",
                keyValue: 2);
        }
    }
}
