-- CreateTable
CREATE TABLE "rentals" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "customerId" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "customers" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "games" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "console-uses" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "customerId" BIGINT
);

-- CreateTable
CREATE TABLE "consoles" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "pricePerHour" DECIMAL NOT NULL
);

-- CreateTable
CREATE TABLE "platforms" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "game-platforms" (
    "dailyPrice" DECIMAL NOT NULL,
    "gameId" BIGINT NOT NULL,
    "platformId" BIGINT NOT NULL,

    PRIMARY KEY ("gameId", "platformId")
);

-- CreateTable
CREATE TABLE "rental-items" (
    "days" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "rentalId" BIGINT NOT NULL,
    "gameId" BIGINT NOT NULL,

    PRIMARY KEY ("gameId", "rentalId")
);

-- CreateTable
CREATE TABLE "console-acessories" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "consoleId" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "_GameToPlatform" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL
);

-- CreateIndex
CREATE INDEX "rentals_customerId_idx" ON "rentals"("customerId");

-- CreateIndex
CREATE UNIQUE INDEX "customers_email_key" ON "customers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "customers_phone_key" ON "customers"("phone");

-- CreateIndex
CREATE INDEX "console-uses_customerId_idx" ON "console-uses"("customerId");

-- CreateIndex
CREATE UNIQUE INDEX "platforms_name_key" ON "platforms"("name");

-- CreateIndex
CREATE INDEX "game-platforms_gameId_idx" ON "game-platforms"("gameId");

-- CreateIndex
CREATE INDEX "game-platforms_platformId_idx" ON "game-platforms"("platformId");

-- CreateIndex
CREATE INDEX "rental-items_gameId_idx" ON "rental-items"("gameId");

-- CreateIndex
CREATE INDEX "rental-items_rentalId_idx" ON "rental-items"("rentalId");

-- CreateIndex
CREATE INDEX "console-acessories_consoleId_idx" ON "console-acessories"("consoleId");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToPlatform_AB_unique" ON "_GameToPlatform"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToPlatform_B_index" ON "_GameToPlatform"("B");
