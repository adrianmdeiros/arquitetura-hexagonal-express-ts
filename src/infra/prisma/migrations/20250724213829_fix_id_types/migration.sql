/*
  Warnings:

  - You are about to alter the column `A` on the `_GameToPlatform` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `B` on the `_GameToPlatform` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `console-acessories` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `consoleId` on the `console-acessories` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `id` on the `console-acessories` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `console-uses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `customerId` on the `console-uses` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `id` on the `console-uses` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `consoles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `consoles` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `customers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `customers` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `game-platforms` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `gameId` on the `game-platforms` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `platformId` on the `game-platforms` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `games` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `games` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `platforms` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `platforms` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `rental-items` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `gameId` on the `rental-items` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `platformId` on the `rental-items` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `rentalId` on the `rental-items` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `rentals` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `customerId` on the `rentals` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `id` on the `rentals` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new__GameToPlatform" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);
INSERT INTO "new__GameToPlatform" ("A", "B") SELECT "A", "B" FROM "_GameToPlatform";
DROP TABLE "_GameToPlatform";
ALTER TABLE "new__GameToPlatform" RENAME TO "_GameToPlatform";
CREATE UNIQUE INDEX "_GameToPlatform_AB_unique" ON "_GameToPlatform"("A", "B");
CREATE INDEX "_GameToPlatform_B_index" ON "_GameToPlatform"("B");
CREATE TABLE "new_console-acessories" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "consoleId" INTEGER NOT NULL
);
INSERT INTO "new_console-acessories" ("consoleId", "id", "name") SELECT "consoleId", "id", "name" FROM "console-acessories";
DROP TABLE "console-acessories";
ALTER TABLE "new_console-acessories" RENAME TO "console-acessories";
CREATE INDEX "console-acessories_consoleId_idx" ON "console-acessories"("consoleId");
CREATE TABLE "new_console-uses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "customerId" INTEGER
);
INSERT INTO "new_console-uses" ("customerId", "id") SELECT "customerId", "id" FROM "console-uses";
DROP TABLE "console-uses";
ALTER TABLE "new_console-uses" RENAME TO "console-uses";
CREATE INDEX "console-uses_customerId_idx" ON "console-uses"("customerId");
CREATE TABLE "new_consoles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "pricePerHour" DECIMAL NOT NULL
);
INSERT INTO "new_consoles" ("id", "name", "pricePerHour") SELECT "id", "name", "pricePerHour" FROM "consoles";
DROP TABLE "consoles";
ALTER TABLE "new_consoles" RENAME TO "consoles";
CREATE TABLE "new_customers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL
);
INSERT INTO "new_customers" ("email", "id", "name", "password", "phone") SELECT "email", "id", "name", "password", "phone" FROM "customers";
DROP TABLE "customers";
ALTER TABLE "new_customers" RENAME TO "customers";
CREATE UNIQUE INDEX "customers_email_key" ON "customers"("email");
CREATE UNIQUE INDEX "customers_phone_key" ON "customers"("phone");
CREATE TABLE "new_game-platforms" (
    "dailyPrice" DECIMAL NOT NULL,
    "gameId" INTEGER NOT NULL,
    "platformId" INTEGER NOT NULL,

    PRIMARY KEY ("gameId", "platformId")
);
INSERT INTO "new_game-platforms" ("dailyPrice", "gameId", "platformId") SELECT "dailyPrice", "gameId", "platformId" FROM "game-platforms";
DROP TABLE "game-platforms";
ALTER TABLE "new_game-platforms" RENAME TO "game-platforms";
CREATE INDEX "game-platforms_gameId_idx" ON "game-platforms"("gameId");
CREATE INDEX "game-platforms_platformId_idx" ON "game-platforms"("platformId");
CREATE TABLE "new_games" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_games" ("id", "name") SELECT "id", "name" FROM "games";
DROP TABLE "games";
ALTER TABLE "new_games" RENAME TO "games";
CREATE TABLE "new_platforms" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_platforms" ("id", "name") SELECT "id", "name" FROM "platforms";
DROP TABLE "platforms";
ALTER TABLE "new_platforms" RENAME TO "platforms";
CREATE UNIQUE INDEX "platforms_name_key" ON "platforms"("name");
CREATE TABLE "new_rental-items" (
    "gameId" INTEGER NOT NULL,
    "platformId" INTEGER NOT NULL,
    "rentalId" INTEGER NOT NULL,
    "days" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,

    PRIMARY KEY ("gameId", "platformId", "rentalId")
);
INSERT INTO "new_rental-items" ("days", "gameId", "platformId", "quantity", "rentalId") SELECT "days", "gameId", "platformId", "quantity", "rentalId" FROM "rental-items";
DROP TABLE "rental-items";
ALTER TABLE "new_rental-items" RENAME TO "rental-items";
CREATE INDEX "rental-items_gameId_idx" ON "rental-items"("gameId");
CREATE INDEX "rental-items_platformId_idx" ON "rental-items"("platformId");
CREATE INDEX "rental-items_rentalId_idx" ON "rental-items"("rentalId");
CREATE TABLE "new_rentals" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "customerId" INTEGER NOT NULL,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_rentals" ("customerId", "date", "id") SELECT "customerId", "date", "id" FROM "rentals";
DROP TABLE "rentals";
ALTER TABLE "new_rentals" RENAME TO "rentals";
CREATE INDEX "rentals_customerId_idx" ON "rentals"("customerId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
