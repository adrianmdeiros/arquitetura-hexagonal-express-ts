/*
  Warnings:

  - The primary key for the `rental-items` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_rental-items" (
    "gameId" BIGINT NOT NULL,
    "platformId" BIGINT NOT NULL,
    "rentalId" BIGINT NOT NULL,
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
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
