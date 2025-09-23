/*
  Warnings:

  - Added the required column `platformId` to the `rental-items` table without a default value. This is not possible if the table is not empty.

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

    PRIMARY KEY ("gameId", "rentalId")
);
INSERT INTO "new_rental-items" ("days", "gameId", "quantity", "rentalId") SELECT "days", "gameId", "quantity", "rentalId" FROM "rental-items";
DROP TABLE "rental-items";
ALTER TABLE "new_rental-items" RENAME TO "rental-items";
CREATE INDEX "rental-items_gameId_idx" ON "rental-items"("gameId");
CREATE INDEX "rental-items_rentalId_idx" ON "rental-items"("rentalId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
