<script setup lang="ts">
  import Layout from '@/layouts/Default.vue'
  import type { TableColumn } from '@nuxt/ui'
  import { getPaginationRowModel, type Row } from '@tanstack/table-core'
  import { useFetch } from '@vueuse/core'
  import { upperFirst } from 'scule'
  import { h, ref, resolveComponent, useTemplateRef, watch } from 'vue'
  import type { User } from '../types'
  import type { CommandPaletteGroup } from '@nuxt/ui'

  defineOptions({ layout: Layout })

  const UAvatar = resolveComponent('UAvatar')
  const UButton = resolveComponent('UButton')
  const UBadge = resolveComponent('UBadge')
  const UDropdownMenu = resolveComponent('UDropdownMenu')
  const USelectMenu = resolveComponent('USelectMenu')
  const UCheckbox = resolveComponent('UCheckbox')
  const UPageGrid = resolveComponent('UPageGrid')
  const UPageCard = resolveComponent('UPageCard')
  const UContainer = resolveComponent('UContainer')
  const UCommandPalette = resolveComponent('UCommandPalette')

  const toast = useToast()
  const table = useTemplateRef('table')

  // select
  const { data: users, execute } = useFetch('https://jsonplaceholder.typicode.com/users', {
    key: 'typicode-users-email',
    transform: (data: { id: number, name: string, email: string }[]) => {
      return data?.map(user => ({
        label: user.name,
        email: user.email,
        value: String(user.id),
        avatar: { src: `https://i.pravatar.cc/120?img=${user.id}`, loading: 'lazy' as const }
      }))
    },
    immediate: false
  })

  HTMLFormControlsCollection.log(users)
ź
  function onOpen () {
    if (!users.value?.length) {
      execute()
    }
  }

  //select fim

  

</script>

<template>
  <UDashboardPanel id="purchases">
    <template #header>
      <UDashboardNavbar title="Purchases">
        <template #leading>
          <UDashboardSidebarCollapse as="button" :disabled="false" />
        </template>

        <template #right>
          <UButton variant="solid" color="error" size="sm" icon="i-lucide-monitor-cog" class="ml-2">
            Training Model
          </UButton>
        </template>
      </UDashboardNavbar>
    </template>

    <template #body>
      <div class="flex gap-3 ">
        <div class="h-screen bg-amber-100">
          <USelectMenu :items="users" icon="i-lucide-user" placeholder="Select user" :ui="{ content: 'min-w-fit' }"
            class="w-48" @update:open="onOpen">
            <template #item-label="{ item }">
              {{ item.label }}

              <span class="text-muted">
                {{ item.email }}
              </span>
            </template>
          </USelectMenu>
        </div>
        <div class="w-3/5">
          <UCard variant="subtle">
            <template #header>
              <Placeholder class="h-8" />
            </template>

            <Placeholder class="h-32" />

            <template #footer>
              <Placeholder class="h-8" />
            </template>
          </UCard>
        </div>
      </div>

      
    </template>
  </UDashboardPanel>
</template>
