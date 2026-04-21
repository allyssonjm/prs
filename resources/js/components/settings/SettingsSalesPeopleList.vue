<script setup lang="ts">
  import type { DropdownMenuItem } from '@nuxt/ui'
  import type { SalesPerson } from '../../types'

  defineProps<{
    salesPeople: SalesPerson[]
  }>()

  const items = [
    {
      label: 'Edit',
      onSelect: () => console.log('Edit'),
    },
    {
      label: 'Remove',
      color: 'error' as const,
      onSelect: () => console.log('Remove'),
    },
  ] satisfies DropdownMenuItem[]
</script>

<template>
  <ul role="list" class="divide-y divide-default">
    <li v-for="(salesPerson, index) in salesPeople" :key="index" class="flex items-center justify-between gap-3 px-4 py-3 sm:px-6">
      <div class="flex min-w-0 items-center gap-3">
        <UAvatar :src="salesPerson.avatar" size="md" />
        <div class="min-w-0 text-sm">
          <p class="truncate font-medium text-highlighted">
            {{ salesPerson.name }}
          </p>
          <p class="truncate text-muted">
            {{ salesPerson.nickname }}
          </p>
        </div>
      </div>

      <div class="flex items-center gap-3">
        <UBadge icon="i-lucide-mail" size="md" color="secondary" variant="solid">{{ salesPerson.email }}</UBadge>

        <UDropdownMenu :items="items" :content="{ align: 'end' }">
          <UButton icon="i-lucide-ellipsis-vertical" color="neutral" variant="ghost" />
        </UDropdownMenu>
      </div>
    </li>
  </ul>
</template>
