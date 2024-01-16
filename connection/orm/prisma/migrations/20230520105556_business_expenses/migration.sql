-- CreateTable
CREATE TABLE "drmg"."business_org" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "addressOne" TEXT NOT NULL,
    "addressTwo" TEXT NOT NULL,
    "postCode" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_org_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."contact" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT,
    "mobile" TEXT,
    "user_id" TEXT,

    CONSTRAINT "contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_contact" (
    "businessId" INTEGER NOT NULL,
    "contactId" INTEGER NOT NULL,
    "currentlyActive" INTEGER NOT NULL DEFAULT 1,
    "connectionType" TEXT NOT NULL,
    "connectionNotes" TEXT,
    "email" VARCHAR(255),
    "mobile" VARCHAR(100),
    "country" VARCHAR(255),
    "location" VARCHAR(255),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_contact_pkey" PRIMARY KEY ("businessId","contactId")
);

-- CreateTable
CREATE TABLE "drmg"."business_trade_partner" (
    "businessId" INTEGER NOT NULL,
    "tradePartnerId" INTEGER NOT NULL,
    "currentlyActive" INTEGER NOT NULL DEFAULT 1,
    "isDebtor" INTEGER NOT NULL DEFAULT 0,
    "isCreditor" INTEGER NOT NULL DEFAULT 0,
    "connectionNotes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_trade_partner_pkey" PRIMARY KEY ("businessId","tradePartnerId")
);

-- CreateTable
CREATE TABLE "drmg"."ledger" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ledger_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."recurring_expense" (
    "id" SERIAL NOT NULL,
    "businessId" INTEGER NOT NULL,
    "creditorId" INTEGER NOT NULL,
    "ledgerId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "frequency" TEXT NOT NULL,
    "interval" INTEGER NOT NULL,
    "nextDueDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "recurring_expense_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."expense_payment" (
    "id" SERIAL NOT NULL,
    "businessId" INTEGER NOT NULL,
    "ledgerId" INTEGER NOT NULL,
    "creditorId" INTEGER,
    "amount" DOUBLE PRECISION NOT NULL,
    "date_due" TIMESTAMP(3) NOT NULL,
    "date_paid" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "invoice_no" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "recurringExpenseId" INTEGER,

    CONSTRAINT "expense_payment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "business_org_name_key" ON "drmg"."business_org"("name");

-- CreateIndex
CREATE UNIQUE INDEX "contact_user_id_key" ON "drmg"."contact"("user_id");

-- AddForeignKey
ALTER TABLE "drmg"."contact" ADD CONSTRAINT "contact_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_contact" ADD CONSTRAINT "business_contact_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_contact" ADD CONSTRAINT "business_contact_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "drmg"."contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_trade_partner" ADD CONSTRAINT "business_trade_partner_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_trade_partner" ADD CONSTRAINT "business_trade_partner_tradePartnerId_fkey" FOREIGN KEY ("tradePartnerId") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_creditorId_fkey" FOREIGN KEY ("creditorId") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_ledgerId_fkey" FOREIGN KEY ("ledgerId") REFERENCES "drmg"."ledger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_ledgerId_fkey" FOREIGN KEY ("ledgerId") REFERENCES "drmg"."ledger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_creditorId_fkey" FOREIGN KEY ("creditorId") REFERENCES "drmg"."business_org"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_recurringExpenseId_fkey" FOREIGN KEY ("recurringExpenseId") REFERENCES "drmg"."recurring_expense"("id") ON DELETE SET NULL ON UPDATE CASCADE;
