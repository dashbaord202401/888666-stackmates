import {
  pgTable,
  pgSchema,
  foreignKey,
  pgEnum,
  text,
  integer,
  timestamp,
  uniqueIndex,
  varchar,
  jsonb,
  boolean,
  index,
  serial,
  date,
  numeric,
  doublePrecision,
} from 'drizzle-orm/pg-core';

import { sql } from 'drizzle-orm';
export const stripeSubscriptionStatus = pgEnum('StripeSubscriptionStatus', [
  'incomplete',
  'incomplete_expired',
  'trialing',
  'active',
  'past_due',
  'canceled',
  'unpaid',
  'paused',
]);
export const keyStatus = pgEnum('key_status', [
  'default',
  'valid',
  'invalid',
  'expired',
]);
export const keyType = pgEnum('key_type', [
  'aead-ietf',
  'aead-det',
  'hmacsha512',
  'hmacsha256',
  'auth',
  'shorthash',
  'generichash',
  'kdf',
  'secretbox',
  'secretstream',
  'stream_xchacha20',
]);
export const aalLevel = pgEnum('aal_level', ['aal1', 'aal2', 'aal3']);
export const codeChallengeMethod = pgEnum('code_challenge_method', [
  's256',
  'plain',
]);
export const factorStatus = pgEnum('factor_status', ['unverified', 'verified']);
export const factorType = pgEnum('factor_type', ['totp', 'webauthn']);

export const ecommerce = pgSchema('ecommerce');
export const practice = pgSchema('practice');

export const invoices = ecommerce.table('invoices', {
  id: text('id').primaryKey().notNull(),
  customerId: text('customer_id')
    .notNull()
    .references(() => customers.id, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  amount: integer('amount').notNull(),
  status: text('status').notNull(),
  date: timestamp('date', { precision: 3, mode: 'string' }).notNull(),
});

export const customers = ecommerce.table(
  'customers',
  {
    id: text('id').primaryKey().notNull(),
    name: text('name').notNull(),
    email: text('email').notNull(),
  },
  (table) => {
    return {
      emailKey: uniqueIndex('customers_email_key').on(table.email),
    };
  }
);

export const prismaMigrations = pgTable('_prisma_migrations', {
  id: varchar('id', { length: 36 }).primaryKey().notNull(),
  checksum: varchar('checksum', { length: 64 }).notNull(),
  finishedAt: timestamp('finished_at', { withTimezone: true, mode: 'string' }),
  migrationName: varchar('migration_name', { length: 255 }).notNull(),
  logs: text('logs'),
  rolledBackAt: timestamp('rolled_back_at', {
    withTimezone: true,
    mode: 'string',
  }),
  startedAt: timestamp('started_at', { withTimezone: true, mode: 'string' })
    .defaultNow()
    .notNull(),
  appliedStepsCount: integer('applied_steps_count').default(0).notNull(),
});

export const account = pgTable(
  'Account',
  {
    id: text('id').primaryKey().notNull(),
    userId: text('userId')
      .notNull()
      .references(() => user.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
    type: text('type').notNull(),
    provider: text('provider').notNull(),
    providerAccountId: text('providerAccountId').notNull(),
    refreshToken: text('refresh_token'),
    accessToken: text('access_token'),
    expiresAt: integer('expires_at'),
    tokenType: text('token_type'),
    scope: text('scope'),
    idToken: text('id_token'),
    sessionState: text('session_state'),
  },
  (table) => {
    return {
      providerProviderAccountIdKey: uniqueIndex(
        'Account_provider_providerAccountId_key'
      ).on(table.provider, table.providerAccountId),
    };
  }
);

export const session = pgTable(
  'Session',
  {
    id: text('id').primaryKey().notNull(),
    sessionToken: text('sessionToken').notNull(),
    userId: text('userId')
      .notNull()
      .references(() => user.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
    expires: timestamp('expires', { precision: 3, mode: 'string' }).notNull(),
  },
  (table) => {
    return {
      sessionTokenKey: uniqueIndex('Session_sessionToken_key').on(
        table.sessionToken
      ),
    };
  }
);

export const verificationToken = pgTable(
  'VerificationToken',
  {
    identifier: text('identifier').notNull(),
    token: text('token').notNull(),
    expires: timestamp('expires', { precision: 3, mode: 'string' }).notNull(),
  },
  (table) => {
    return {
      tokenKey: uniqueIndex('VerificationToken_token_key').on(table.token),
      identifierTokenKey: uniqueIndex(
        'VerificationToken_identifier_token_key'
      ).on(table.identifier, table.token),
    };
  }
);

export const stripeEvent = pgTable(
  'StripeEvent',
  {
    id: text('id').primaryKey().notNull(),
    apiVersion: text('api_version'),
    data: jsonb('data').notNull(),
    request: jsonb('request'),
    type: text('type').notNull(),
    object: text('object').notNull(),
    account: text('account'),
    created: timestamp('created', { precision: 3, mode: 'string' }).notNull(),
    livemode: boolean('livemode').notNull(),
    pendingWebhooks: integer('pending_webhooks').notNull(),
  },
  (table) => {
    return {
      idKey: uniqueIndex('StripeEvent_id_key').on(table.id),
    };
  }
);

export const user = pgTable(
  'User',
  {
    id: text('id').primaryKey().notNull(),
    name: text('name'),
    email: text('email'),
    emailVerified: timestamp('emailVerified', { precision: 3, mode: 'string' }),
    image: text('image'),
    gsProviderId: integer('gs_provider_id'),
    gsUserId: integer('gs_user_id'),
    role: text('role'),
    gsClientId: integer('gs_client_id'),
    stripeCustomerId: text('stripe_customer_id'),
    stripeSubscriptionId: text('stripe_subscription_id'),
    stripeSubscriptionStatus: stripeSubscriptionStatus(
      'stripe_subscription_status'
    ),
    activeDrmgOrgId: integer('active_drmg_org_id'),
  },
  (table) => {
    return {
      emailKey: uniqueIndex('User_email_key').on(table.email),
    };
  }
);

export const infusionsoftClients = practice.table(
  'infusionsoft_clients',
  {
    id: serial('id').primaryKey().notNull(),
    firstName: varchar('first_name', { length: 100 }),
    lastName: varchar('last_name', { length: 100 }),
    dateOfBirth: date('date_of_birth'),
    email: varchar('email', { length: 100 }),
  },
  (table) => {
    return {
      lastNameEmailIdx: index('infusionsoft_clients_last_name_email_idx').on(
        table.lastName,
        table.email
      ),
    };
  }
);

export const conditions = practice.table('conditions', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  conditionId: integer('condition_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  authorisationSiteId: integer('authorisation_site_id'),
  authorisationSiteName: varchar('authorisation_site_name', { length: 200 }),
  conditionType: varchar('condition_type', { length: 200 }),
  conditionTypeName: varchar('condition_type_name', { length: 200 }),
  isEpcFunded: varchar('is_epc_funded', { length: 200 }),
  providerId: integer('provider_id')
    .notNull()
    .references(() => providers.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  providerName: varchar('provider_name', { length: 200 }),
  claimNo: varchar('claim_no', { length: 200 }),
  referredById: integer('referred_by_id'),
  referredByType: varchar('referred_by_type', { length: 200 }),
  referredByTypeName: varchar('referred_by_type_name', { length: 200 }),
  externalId: varchar('external_id', { length: 200 }),
  clientId: integer('client_id').notNull(),
  referenceNo: varchar('reference_no', { length: 200 }),
  dateCreated: date('date_created'),
  dateUpdated: date('date_updated'),
  dateOfInjury: date('date_of_injury'),
  dateOfReferral: date('date_of_referral'),
  dateReferralExpires: date('date_referral_expires'),
  motorVehicleInd: varchar('motor_vehicle_ind', { length: 200 }),
  injuryDescription: varchar('injury_description', { length: 200 }),
  causeOfInjury: text('cause_of_injury'),
  workIntensityId: integer('work_intensity_id'),
  workIntensityName: varchar('work_intensity_name', { length: 200 }),
});

export const conditionsDischarged = practice.table('conditions_discharged', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  organisationId: integer('organisation_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  clientId: integer('client_id').notNull(),
  clientTitle: varchar('client_title', { length: 255 }),
  clientFirstName: varchar('client_first_name', { length: 255 }),
  clientKnownAs: varchar('client_known_as', { length: 255 }),
  clientLastName: varchar('client_last_name', { length: 255 }),
  providerId: integer('provider_id').notNull(),
  providerName: varchar('provider_name', { length: 255 }),
  providerType: varchar('provider_type', { length: 255 }),
  providerTypeName: varchar('provider_type_name', { length: 255 }),
  conditionId: integer('condition_id')
    .notNull()
    .references(() => conditions.conditionId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  claimNumber: varchar('claim_number', { length: 255 }),
  readCodeList: text('read_code_list'),
  totalAppointments: integer('total_appointments').notNull(),
  totalProvidersSeen: integer('total_providers_seen').notNull(),
  dischargedInd: integer('discharged_ind').notNull(),
  dischargeSummary: text('discharge_summary'),
  outcomeId: integer('outcome_id').notNull(),
  outcomeType: varchar('outcome_type', { length: 255 }),
  outcomeDetails: text('outcome_details'),
  dateOfInjury: date('date_of_injury'),
  dateFirstAppointment: date('date_first_appointment'),
  dateDischarged: date('date_discharged'),
  dateForFollowup: date('date_for_followup'),
  dateFollowupCompleted: date('date_followup_completed'),
});

export const conditionInjuries = practice.table('condition_injuries', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  conditionId: integer('condition_id')
    .notNull()
    .references(() => conditions.conditionId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  organisationId: integer('organisation_id').notNull(),
  injuryTypeId: integer('injury_type_id').notNull(),
  injuryTypeName: varchar('injury_type_name', { length: 200 }),
  side: varchar('side', { length: 200 }),
});

export const appointments = practice.table('appointments', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  appointmentId: integer('appointment_id').notNull(),
  startDatetime: timestamp('start_datetime', { precision: 6, mode: 'string' }),
  durations: integer('durations'),
  clientId: integer('client_id')
    .notNull()
    .references(() => clients.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  clientName: varchar('client_name', { length: 200 }),
  clientFirstName: varchar('client_first_name', { length: 200 }),
  clientLastName: varchar('client_last_name', { length: 200 }),
  clientEmail: varchar('client_email', { length: 200 }),
  clientMobile: varchar('client_mobile', { length: 200 }),
  siteName: varchar('site_name', { length: 200 }),
  providerId: integer('provider_id')
    .notNull()
    .references(() => providers.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  providerName: varchar('provider_name', { length: 200 }),
  providerFirstName: varchar('provider_first_name', { length: 200 }),
  providerLastName: varchar('provider_last_name', { length: 200 }),
  providerPhone: varchar('provider_phone', { length: 200 }),
  providerEmail: varchar('provider_email', { length: 200 }),
  isFirstAppointment: varchar('is_first_appointment', { length: 3 }),
});

export const appointmentClients = practice.table('appointment_clients', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  deletedInd: integer('deleted_ind').notNull(),
  vendorId: integer('vendor_id').notNull(),
  organisationId: integer('organisation_id').notNull(),
  siteId: integer('site_id').notNull(),
  siteName: varchar('site_name', { length: 200 }),
  providerId: integer('provider_id')
    .notNull()
    .references(() => providers.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  providerName: varchar('provider_name', { length: 200 }),
  startDatetime: timestamp('start_datetime', { precision: 6, mode: 'string' }),
  dateUpdated: timestamp('date_updated', { precision: 6, mode: 'string' }),
  clientId: integer('client_id')
    .notNull()
    .references(() => clients.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  clientName: varchar('client_name', { length: 200 }),
  providerDuration: integer('provider_duration'),
  appointmentStatusIndicator: integer('appointment_status_indicator'),
  appointmentStatusName: varchar('appointment_status_name', { length: 200 }),
  dnaCancelledAmount: numeric('dna_cancelled_amount'),
  dnaCancelledTaxAmount: numeric('dna_cancelled_tax_amount'),
  chargeAmount: numeric('charge_amount'),
  chargeTaxAmount: numeric('charge_tax_amount'),
  scheduleClaimAmount: numeric('schedule_claim_amount'),
  scheduleClaimTaxAmount: numeric('schedule_claim_tax_amount'),
});

export const appointmentConditions = practice.table('appointment_conditions', {
  id: serial('id').primaryKey().notNull(),
  appointmentId: integer('appointment_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  conditionId: integer('condition_id')
    .notNull()
    .references(() => conditions.conditionId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  conditionType: varchar('condition_type', { length: 200 }),
  conditionTypeName: varchar('condition_type_name', { length: 200 }),
  startDateTime: timestamp('start_date_time', {
    precision: 6,
    mode: 'string',
  }).notNull(),
  providerDuration: integer('provider_duration'),
  clientCharge: numeric('client_charge'),
  siteId: integer('site_id'),
  siteName: varchar('site_name', { length: 200 }),
  providerId: integer('provider_id')
    .notNull()
    .references(() => providers.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  providerName: varchar('provider_name', { length: 200 }),
  billingCode: varchar('billing_code', { length: 200 }),
  appointmentStatusIndicator: varchar('appointment_status_indicator', {
    length: 20,
  }),
  appointmentStatusName: varchar('appointment_status_name', { length: 200 }),
  isEpcFunded: integer('is_epc_funded'),
  motorVehicleInd: integer('motor_vehicle_ind'),
  dvaNumber: varchar('dva_number', { length: 200 }),
});

export const sites = practice.table('sites', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  externalReference: varchar('external_reference', { length: 100 }),
  activeInd: integer('active_ind').notNull(),
  adminOnlyInd: integer('admin_only_ind').notNull(),
  dateUpdated: date('date_updated'),
  name: varchar('name', { length: 100 }),
  tradingName: varchar('trading_name', { length: 100 }),
  gstNumber: varchar('gst_number', { length: 100 }),
  phone: varchar('phone', { length: 100 }),
  mobile: varchar('mobile', { length: 100 }),
  email: varchar('email', { length: 100 }),
  address: varchar('address', { length: 100 }),
  postalAddress: varchar('postal_address', { length: 100 }),
  timezone: varchar('timezone', { length: 100 }),
});

export const snapshotIncompleteExams = practice.table(
  'snapshot_incomplete_exams',
  {
    id: serial('id').primaryKey().notNull(),
    dateReportFrom: date('date_report_from'),
    dateReportTo: date('date_report_to'),
    importId: integer('import_id').notNull(),
    vendorId: integer('vendor_id').notNull(),
    siteId: integer('site_id')
      .notNull()
      .references(() => sites.importId, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    clinicianId: integer('clinician_id').notNull(),
    clinicianName: varchar('clinician_name', { length: 100 }),
    dateExam: date('date_exam'),
    clientName: varchar('client_name', { length: 100 }),
    claimNo: varchar('claim_no', { length: 50 }),
    conditionType: varchar('condition_type', { length: 50 }),
    conditionTypeName: varchar('condition_type_name', { length: 50 }),
    status: varchar('status', { length: 10 }),
    hasExam: varchar('has_exam', { length: 5 }),
    periodNumber: integer('period_number'),
    reportPeriod: varchar('report_period', { length: 20 }),
    utcDateReportFrom: timestamp('utc_date_report_from', {
      precision: 6,
      mode: 'string',
    }),
    utcDateReportTo: timestamp('utc_date_report_to', {
      precision: 6,
      mode: 'string',
    }),
  }
);

export const providers = practice.table('providers', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  organisationId: integer('organisation_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  activeInd: integer('active_ind').notNull(),
  adminOnlyInd: integer('admin_only_ind').notNull(),
  externalId: varchar('external_id', { length: 100 }),
  providerTypeName: varchar('provider_type_name', { length: 100 }),
  title: varchar('title', { length: 100 }),
  firstName: varchar('first_name', { length: 100 }),
  middleName: varchar('middle_name', { length: 100 }),
  lastName: varchar('last_name', { length: 100 }),
  code: varchar('code', { length: 100 }),
  systemUserId: integer('system_user_id').notNull(),
  systemUserName: varchar('system_user_name', { length: 100 }),
  phone: varchar('phone', { length: 100 }),
  mobile: varchar('mobile', { length: 100 }),
  email: varchar('email', { length: 100 }),
  address: varchar('address', { length: 100 }),
  contractorInd: integer('contractor_ind'),
  externalRef: varchar('external_ref', { length: 100 }),
  dateCreated: timestamp('date_created', {
    precision: 6,
    mode: 'string',
  }).notNull(),
  dateUpdated: timestamp('date_updated', {
    precision: 6,
    mode: 'string',
  }).notNull(),
  clientId: integer('client_id'),
  imageUrl: varchar('image_url', { length: 255 }),
});

export const clients = practice.table(
  'clients',
  {
    id: serial('id').primaryKey().notNull(),
    importId: integer('import_id').notNull(),
    infusionsoftId: integer('infusionsoft_id').notNull(),
    dateCreated: timestamp('date_created', {
      precision: 6,
      mode: 'string',
    }).notNull(),
    dateUpdated: timestamp('date_updated', {
      precision: 6,
      mode: 'string',
    }).notNull(),
    vendorId: integer('vendor_id').notNull(),
    organisationId: integer('organisation_id').notNull(),
    nhiNumber: varchar('nhi_number', { length: 50 }),
    titleId: integer('title_id'),
    title: varchar('title', { length: 10 }),
    sex: varchar('sex', { length: 1 }),
    firstName: varchar('first_name', { length: 100 }),
    lastName: varchar('last_name', { length: 100 }),
    knownAs: varchar('known_as', { length: 100 }),
    middleName: varchar('middle_name', { length: 100 }),
    maidenName: varchar('maiden_name', { length: 100 }),
    dateOfBirth: date('date_of_birth'),
    phone: varchar('phone', { length: 100 }),
    mobile: varchar('mobile', { length: 100 }),
    email: varchar('email', { length: 100 }),
    homeSiteId: integer('home_site_id'),
    homeSite: varchar('home_site', { length: 100 }),
    homeAddress: varchar('home_address', { length: 255 }),
    workAddress: varchar('work_address', { length: 255 }),
    postalAddress: varchar('postal_address', { length: 255 }),
    employerId: integer('employer_id').default(-1),
    employerName: varchar('employer_name', { length: 255 }),
    employerEmail: varchar('employer_email', { length: 255 }),
    firstNames: varchar('first_names', { length: 255 }),
    whyChooseUsId: integer('why_choose_us_id').default(-1),
    whyChooseUs: varchar('why_choose_us', { length: 255 }),
    referralSourceId: integer('referral_source_id').default(-1),
    referralSource: varchar('referral_source', { length: 255 }),
    referredByType: varchar('referred_by_type', { length: 255 }),
    referredById: integer('referred_by_id').default(-1),
    medicalCentreId: integer('medical_centre_id').default(-1),
    medicalCentre: varchar('medical_centre', { length: 255 }),
    gpId: integer('gp_id').default(-1),
    gpName: varchar('gp_name', { length: 255 }),
    occupationId: integer('occupation_id').default(-1),
    occupationName: varchar('occupation_name', { length: 255 }),
    healthInsurer: varchar('health_insurer', { length: 255 }),
    workIntensityId: integer('work_intensity_id').default(-1),
    workIntensityName: varchar('work_intensity_name', { length: 255 }),
    ethnicGroupId: integer('ethnic_group_id').default(-1),
    ethnicGroupName: varchar('ethnic_group_name', { length: 255 }),
    ethnicGroupOther: varchar('ethnic_group_other', { length: 255 }),
    homeAddressStreet: varchar('home_address_street', { length: 255 }),
    homeAddressSuburb: varchar('home_address_suburb', { length: 255 }),
    homeAddressCity: varchar('home_address_city', { length: 255 }),
    homeAddressState: varchar('home_address_state', { length: 255 }),
    homeAddressPostcode: varchar('home_address_postcode', { length: 255 }),
    homeAddressCountry: varchar('home_address_country', { length: 255 }),
    uniquePostalAddressInd: integer('unique_postal_address_ind'),
    postalAddressStreet: varchar('postal_address_street', { length: 255 }),
    postalAddressSuburb: varchar('postal_address_suburb', { length: 255 }),
    postalAddressCity: varchar('postal_address_city', { length: 255 }),
    postalAddressState: varchar('postal_address_state', { length: 255 }),
    postalAddressPostcode: varchar('postal_address_postcode', { length: 255 }),
    postalAddressCountry: varchar('postal_address_country', { length: 255 }),
    inactiveInd: integer('inactive_ind'),
    deletedInd: integer('deleted_ind'),
    includeInMailouts: integer('include_in_mailouts'),
    dateOfDeath: date('date_of_death'),
    timestampUpdate: timestamp('timestamp_update', {
      precision: 6,
      mode: 'string',
    }).notNull(),
    classTypeTotal: integer('class_type_total'),
    classTypes: varchar('class_types', { length: 255 }),
    conditionsProblems: varchar('conditions_problems', { length: 255 }),
    conditionsTotal: integer('conditions_total'),
    contractsTotal: integer('contracts_total'),
    contractsTypes: varchar('contracts_types', { length: 255 }),
    dateLastAppt: date('date_last_appt'),
    dateNextAppt: date('date_next_appt'),
    membershipStatus: text('membership_status'),
    membershipTypes: text('membership_types'),
    productsTotal: integer('products_total'),
    productsTypes: varchar('products_types', { length: 255 }),
    crossReferralTotal: integer('cross_referral_total'),
    providerLastAppt: varchar('provider_last_appt', { length: 255 }),
    providerNextAppt: varchar('provider_next_appt', { length: 255 }),
    userId: text('user_id'),
  },
  (table) => {
    return {
      lastNameIdx: index('clients_last_name_idx').on(table.lastName),
      emailIdx: index('clients_email_idx').on(table.email),
      userIdKey: uniqueIndex('clients_user_id_key').on(table.userId),
    };
  }
);

export const infusionsoftClientsNoMarketing = practice.table(
  'infusionsoft_clients_no_marketing',
  {
    id: serial('id').primaryKey().notNull(),
    firstName: varchar('first_name', { length: 100 }),
    lastName: varchar('last_name', { length: 100 }),
    dateOfBirth: date('date_of_birth'),
    email: varchar('email', { length: 100 }),
  },
  (table) => {
    return {
      lastNameEmailIdx: index(
        'infusionsoft_clients_no_marketing_last_name_email_idx'
      ).on(table.lastName, table.email),
    };
  }
);

export const assessments = practice.table('assessments', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  clientId: integer('client_id').notNull(),
  ownerId: integer('owner_id').notNull(),
  ownerTypeId: integer('owner_type_id').notNull(),
  ownerType: text('owner_type').notNull(),
  clinicianTypeId: integer('clinician_type_id').notNull(),
  clinicianType: text('clinician_type'),
  mechanism: text('mechanism'),
  provisionalDiagnosis: text('provisional_diagnosis'),
  deletedInd: integer('deleted_ind').default(0).notNull(),
});

export const assessmentGoals = practice.table('assessment_goals', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  assessmentId: integer('assessment_id').default(0),
  goalId: integer('goal_id').default(0),
  goal: text('goal'),
  goalName: text('goal_name'),
  goalDetails: text('goal_details'),
  activityId: integer('activity_id').default(0),
  activityName: text('activity_name'),
  activityDetails: text('activity_details'),
  estimatedTreatments: integer('estimated_treatments').default(0).notNull(),
  timeframe: integer('timeframe').default(0),
  timeframeTypeId: integer('timeframe_type_id').default(0),
  timeframeTypeName: text('timeframe_type_name'),
  notes: text('notes'),
  planNotes: text('plan_notes'),
  midNotes: text('mid_notes'),
  finalNotes: text('final_notes'),
  nonCompletionNotes: text('non_completion_notes'),
  achievedInd: integer('achieved_ind').default(0),
  createdDate: timestamp('created_date', {
    precision: 3,
    mode: 'string',
  }).notNull(),
  startByDate: timestamp('start_by_date', { precision: 3, mode: 'string' }),
  startedDate: timestamp('started_date', { precision: 3, mode: 'string' }),
  completeByDate: timestamp('complete_by_date', {
    precision: 3,
    mode: 'string',
  }),
  completedDate: timestamp('completed_date', { precision: 3, mode: 'string' }),
  vendorId: integer('vendor_id').default(0),
  deletedInd: integer('deleted_ind').default(0).notNull(),
});

export const gensolveMetaTypes = practice.table('gensolve_meta_types', {
  id: serial('id').primaryKey().notNull(),
  name: text('name').notNull(),
  description: text('description'),
  importId: integer('import_id').notNull(),
  deletedInd: integer('deleted_ind').default(0).notNull(),
  activeInd: integer('active_ind').default(0).notNull(),
  dateUpdated: timestamp('date_updated', { precision: 6, mode: 'string' }),
  typeId: integer('type_id').notNull(),
});

export const conditionsDischargedOutcomes = practice.table(
  'conditions_discharged_outcomes',
  {
    id: serial('id').primaryKey().notNull(),
    importId: integer('import_id').notNull(),
    createdById: integer('created_by_id').notNull(),
    patientAssessmentId: integer('patient_assessment_id').notNull(),
    patientAssessmentOwnerId: integer('patient_assessment_owner_id').notNull(),
    patientAssessmentOwnerType: varchar('patient_assessment_owner_type', {
      length: 255,
    }),
    providerType: varchar('provider_type', { length: 255 }),
    measureType: varchar('measure_type', { length: 255 }),
    measureDetails: varchar('measure_details', { length: 255 }),
    dateCreated: date('date_created'),
    dateUpdated: date('date_updated'),
    valFive: integer('val_five').default(0),
    valFiveMeasureDate: date('val_five_measure_date'),
    valFiveMeasureType: varchar('val_five_measure_type', { length: 255 }),
    valFiveMeasureTypeName: varchar('val_five_measure_type_name', {
      length: 255,
    }),
    valFour: integer('val_four').default(0),
    valFourMeasureDate: date('val_four_measure_date'),
    valFourMeasureType: varchar('val_four_measure_type', { length: 255 }),
    valFourMeasureTypeName: varchar('val_four_measure_type_name', {
      length: 255,
    }),
    valOne: integer('val_one').default(0),
    valOneMeasureDate: date('val_one_measure_date'),
    valOneMeasureTypeName: varchar('val_one_measure_type_name', {
      length: 255,
    }),
    valSix: integer('val_six').default(0),
    valSixMeasureDate: date('val_six_measure_date'),
    valSixMeasureType: varchar('val_six_measure_type', { length: 255 }),
    valSixMeasureTypeName: varchar('val_six_measure_type_name', {
      length: 255,
    }),
    valThree: integer('val_three').default(0),
    valThreeMeasureDate: date('val_three_measure_date'),
    valThreeMeasureType: varchar('val_three_measure_type', { length: 255 }),
    valThreeMeasureTypeName: varchar('val_three_measure_type_name', {
      length: 255,
    }),
    valTwo: integer('val_two').default(0),
    valTwoMeasureDate: date('val_two_measure_date'),
    valTwoMeasureTypeName: varchar('val_two_measure_type_name', {
      length: 255,
    }),
  }
);

export const businessEvents = practice.table('business_events', {
  id: serial('id').primaryKey().notNull(),
  status: text('status').notNull(),
  dateOfReport: timestamp('date_of_report', {
    precision: 3,
    mode: 'string',
  }).notNull(),
  eventType: text('event_type').notNull(),
  subject: text('subject'),
  actionTo: text('action_to'),
  relatedContact: text('related_contact'),
  dateCreated: timestamp('date_created', {
    precision: 3,
    mode: 'string',
  }).notNull(),
  dateDue: timestamp('date_due', { precision: 3, mode: 'string' }),
  dateCompleted: timestamp('date_completed', { precision: 3, mode: 'string' }),
  businessFunctionId: integer('business_function_id'),
  businessFunctionName: text('business_function_name'),
  mindsetName: text('mindset_name'),
  processType: text('process_type'),
  dateParsed: timestamp('date_parsed', { precision: 3, mode: 'string' }),
  businessProcedureId: integer('business_procedure_id'),
  parsedFunctionName: text('parsed_function_name'),
  systemUserId: integer('system_user_id'),
});

export const snapshotProviderSaturation = practice.table(
  'snapshot_provider_saturation',
  {
    id: serial('id').primaryKey().notNull(),
    reportPeriod: varchar('report_period', { length: 20 }),
    dateReportFrom: date('date_report_from'),
    dateReportTo: date('date_report_to'),
    providerId: integer('provider_id')
      .notNull()
      .references(() => providers.importId, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    providerName: varchar('provider_name', { length: 200 }),
    siteId: integer('site_id')
      .notNull()
      .references(() => sites.importId, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    siteName: varchar('site_name', { length: 200 }),
    siteAvailabilityDur: numeric('site_availability_dur'),
    noShowDur: numeric('no_show_dur'),
    noShowCount: numeric('no_show_count'),
    inServiceDur: numeric('in_service_dur'),
    inServiceCount: numeric('in_service_count'),
    prvDur: numeric('prv_dur'),
    prvCount: numeric('prv_count'),
    clientDur: numeric('client_dur'),
    clientCount: numeric('client_count'),
    classDur: numeric('class_dur'),
    classCount: numeric('class_count'),
    totalCount: numeric('total_count'),
    periodNumber: integer('period_number'),
    utcDateReportFrom: timestamp('utc_date_report_from', {
      precision: 6,
      mode: 'string',
    }),
    utcDateReportTo: timestamp('utc_date_report_to', {
      precision: 6,
      mode: 'string',
    }),
    dayOfWeek: varchar('day_of_week', { length: 20 }),
    billedSaturation: numeric('billed_saturation'),
    businessSaturation: numeric('business_saturation'),
    clinicalSaturation: numeric('clinical_saturation'),
    reprocessDataInd: integer('reprocess_data_ind').default(0),
  },
  (table) => {
    return {
      dateReportFromDateReportTKey: uniqueIndex(
        'snapshot_provider_saturation_date_report_from_date_report_t_key'
      ).on(
        table.reportPeriod,
        table.dateReportFrom,
        table.dateReportTo,
        table.providerId,
        table.siteId
      ),
    };
  }
);

export const providerAppointments = practice.table('provider_appointments', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  title: text('title').notNull(),
  status: text('status').notNull(),
  type: text('type').notNull(),
  description: text('description'),
  datetimeStart: timestamp('datetime_start', {
    precision: 6,
    mode: 'string',
  }).notNull(),
  datetimeEnd: timestamp('datetime_end', {
    precision: 6,
    mode: 'string',
  }).notNull(),
  isAllDay: boolean('is_all_day').default(false).notNull(),
  startTimezone: text('start_timezone').notNull(),
  endTimezone: text('end_timezone').notNull(),
  recurrenceRule: text('recurrence_rule'),
  recurrenceException: text('recurrence_exception'),
  relatedId: integer('related_id').notNull(),
  recurrenceId: integer('recurrence_id').notNull(),
  roomId: integer('room_id').default(0).notNull(),
  providerId: integer('provider_id').notNull(),
  ownerId: integer('owner_id').default(0).notNull(),
  siteId: integer('site_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  deleted: integer('deleted').default(0).notNull(),
  businessFunctionId: integer('business_function_id'),
  businessFunctionName: text('business_function_name'),
  dateParsed: timestamp('date_parsed', { precision: 3, mode: 'string' }),
  mindsetName: text('mindset_name'),
  processType: text('process_type'),
  businessProcedureId: integer('business_procedure_id'),
  calcHourlyRate: numeric('calc_hourly_rate', { precision: 65, scale: 30 }),
  calcHoursWork: numeric('calc_hours_work', { precision: 65, scale: 30 }),
  calcWorkCost: numeric('calc_work_cost', { precision: 65, scale: 30 }),
});

export const membershipUsage = practice.table('membership_usage', {
  id: serial('id').primaryKey().notNull(),
  appointmentType: integer('appointment_type').notNull(),
  appointmentTypeName: text('appointment_type_name').notNull(),
  clientAppointmentId: integer('client_appointment_id').notNull(),
  apptDateTime: timestamp('appt_date_time', {
    precision: 6,
    mode: 'string',
  }).notNull(),
  clientMembershipId: integer('client_membership_id').notNull(),
  membershipPriceExcl: doublePrecision('membership_price_excl'),
  membershipPriceIncl: doublePrecision('membership_price_incl'),
  siteId: integer('site_id').notNull(),
  providerId: integer('provider_id').notNull(),
  providerName: varchar('provider_name', { length: 50 }).notNull(),
  clientName: varchar('client_name', { length: 100 }).notNull(),
  membershipTypeName: varchar('membership_type_name', {
    length: 100,
  }).notNull(),
  unitsUsed: integer('units_used'),
  unitsValueInclTax: doublePrecision('units_value_incl_tax'),
  unitsValueExclTax: doublePrecision('units_value_excl_tax'),
  appointmentId: integer('appointment_id').notNull(),
  restrictsVisits: boolean('restricts_visits').default(false).notNull(),
  visitsAllowed: integer('visits_allowed'),
});

export const appointmentCharges = practice.table('appointment_charges', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  deletedInd: integer('deleted_ind').notNull(),
  appointmentId: integer('appointment_id').notNull(),
  vendorId: integer('vendor_id').notNull(),
  organisationId: integer('organisation_id').notNull(),
  siteId: integer('site_id').notNull(),
  providerId: integer('provider_id')
    .notNull()
    .references(() => providers.importId, {
      onDelete: 'restrict',
      onUpdate: 'cascade',
    }),
  clientId: integer('client_id').notNull(),
  dateAppt: timestamp('date_appt', { precision: 6, mode: 'string' }).notNull(),
  dateUpdated: timestamp('date_updated', { precision: 6, mode: 'string' }),
  appointmentStatusIndicator: integer('appointment_status_indicator'),
  appointmentStatusName: varchar('appointment_status_name', { length: 200 }),
  chargeTypeId: integer('charge_type_id').notNull(),
  chargeTypeName: varchar('charge_type_name', { length: 200 }),
  chargeTypeCode: varchar('charge_type_code', { length: 200 }),
  quantity: integer('quantity'),
  clientAmount: doublePrecision('client_amount'),
  clientTaxAmount: doublePrecision('client_tax_amount'),
  paidByAmount: doublePrecision('paid_by_amount'),
  paidByTaxAmount: doublePrecision('paid_by_tax_amount'),
  paidById: integer('paid_by_id'),
  invoicedAmount: doublePrecision('invoiced_amount'),
  invoicedTaxAmount: doublePrecision('invoiced_tax_amount'),
  paidByInvoicedAmount: doublePrecision('paid_by_invoiced_amount'),
  paidByInvoicedTaxAmount: doublePrecision('paid_by_invoiced_tax_amount'),
  initialConsultationIndicator: integer('initial_consultation_indicator'),
  reportProviderCost: doublePrecision('report_provider_cost'),
  reportProviderHourlyRate: doublePrecision('report_provider_hourly_rate'),
  reprocessInd: integer('reprocess_ind').default(0),
  reportDurationHours: doublePrecision('report_duration_hours'),
});

export const charges = practice.table('charges', {
  id: serial('id').primaryKey().notNull(),
  importId: integer('import_id').notNull(),
  code: varchar('code', { length: 100 }),
  name: varchar('name', { length: 100 }),
  clientAppointmentType: varchar('client_appointment_type', { length: 100 }),
  appointmentType: varchar('appointment_type', { length: 100 }),
  billingType: varchar('billing_type', { length: 100 }),
  dateFrom: date('date_from'),
  dateTo: date('date_to'),
  clientDisplayName: varchar('client_display_name', { length: 100 }),
  defaultInvoiceNotes: varchar('default_invoice_notes', { length: 100 }),
  isDexCharge: varchar('is_dex_charge', { length: 3 }),
  dexShowTotalCostInd: integer('dex_show_total_cost_ind'),
  dexShowQuantityInd: integer('dex_show_quantity_ind'),
  dexShowDurationInd: integer('dex_show_duration_ind'),
  discountType: varchar('discount_type', { length: 100 }),
  dateUpdated: date('date_updated'),
  deletedInd: integer('deleted_ind'),
  organisationId: integer('organisation_id'),
  debtor: varchar('debtor', { length: 100 }),
  fixedRate: varchar('fixed_rate', { length: 100 }),
  includesTaxInd: varchar('includes_tax_ind', { length: 100 }),
  ledgerId: integer('ledger_id'),
});

export const revenueItems = practice.table('revenue_items', {
  id: serial('id').primaryKey().notNull(),
  itemId: integer('item_id').notNull(),
  itemTypeName: varchar('item_type_name', { length: 50 }),
  itemDetails: varchar('item_details', { length: 255 }),
  debtorId: integer('debtor_id'),
  relatedId: integer('related_id'),
  debtorName: varchar('debtor_name', { length: 255 }),
  otherDetails: varchar('other_details', { length: 255 }),
  productGroupName: varchar('product_group_name', { length: 255 }),
  itemSiteId: integer('item_site_id'),
  siteId: integer('site_id').notNull(),
  siteName: varchar('site_name', { length: 255 }),
  parentSiteName: varchar('parent_site_name', { length: 255 }),
  vendorId: integer('vendor_id').notNull(),
  attributeToName: varchar('attribute_to_name', { length: 255 }),
  attributeToId: integer('attribute_to_id'),
  itemDate: date('item_date'),
  quantity: integer('quantity'),
  amount: doublePrecision('amount'),
  taxAmount: doublePrecision('tax_amount'),
  totalAmount: doublePrecision('total_amount'),
  linkToId: integer('link_to_id'),
  linkToType: varchar('link_to_type', { length: 50 }),
  origItemSiteId: integer('orig_item_site_id'),
  datePaid: date('date_paid'),
  pmtItemId: integer('pmt_item_id'),
  pmtItemType: varchar('pmt_item_type', { length: 50 }),
  referrerTypeId: integer('referrer_type_id'),
  referrerId: integer('referrer_id'),
  referrerName: varchar('referrer_name', { length: 255 }),
  invoiceNo: varchar('invoice_no', { length: 255 }),
  revenueLedgerId: integer('revenue_ledger_id'),
  paymentTypeId: integer('payment_type_id'),
  paymentTypeName: varchar('payment_type_name', { length: 255 }),
  directDepositInd: integer('direct_deposit_ind'),
  commissionItemId: integer('commission_item_id'),
  commissionItemType: varchar('commission_item_type', { length: 50 }),
  revenueItemId: integer('revenue_item_id'),
  utcDateReportFrom: timestamp('utc_date_report_from', {
    precision: 6,
    mode: 'string',
  }),
  utcDateReportTo: timestamp('utc_date_report_to', {
    precision: 6,
    mode: 'string',
  }),
  itemType: integer('item_type').notNull(),
  reportProductInd: integer('report_product_ind').default(0),
});

export const businessAdminAnalysis = practice.table('business_admin_analysis', {
  id: serial('id').primaryKey().notNull(),
  reportStartDate: date('report_start_date').notNull(),
  reportEndDate: date('report_end_date').notNull(),
  reportPeriod: varchar('report_period', { length: 50 }).notNull(),
  vendorId: integer('vendor_id').notNull(),
  siteId: integer('site_id').notNull(),
  siteName: varchar('site_name', { length: 50 }),
  employeeId: integer('employee_id').notNull(),
  employeeName: varchar('employee_name', { length: 50 }),
  businessFunctionId: integer('business_function_id'),
  businessFunctionName: text('business_function_name'),
  businessProcedureId: integer('business_procedure_id'),
  businessProcedure: text('business_procedure'),
  labourHours: doublePrecision('labour_hours'),
  labourCost: doublePrecision('labour_cost'),
  drmgOrgId: integer('drmg_org_id'),
});

export const systemUsers = practice.table(
  'system_users',
  {
    id: serial('id').primaryKey().notNull(),
    importId: integer('import_id').notNull(),
    organisationId: integer('organisation_id').notNull(),
    userName: varchar('user_name', { length: 100 }).notNull(),
    firstName: varchar('first_name', { length: 100 }),
    lastName: varchar('last_name', { length: 100 }),
    activeInd: integer('active_ind').default(1).notNull(),
    contractorInd: integer('contractor_ind'),
    hourlyRate: doublePrecision('hourly_rate'),
    annualSalary: doublePrecision('annual_salary'),
    role: varchar('role', { length: 100 }),
    drmgOrgId: integer('drmg_org_id'),
  },
  (table) => {
    return {
      importIdKey: uniqueIndex('system_users_import_id_key').on(table.importId),
    };
  }
);
