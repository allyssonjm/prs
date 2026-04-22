<script setup lang="ts">
  import Layout from '@/layouts/Default.vue'
  import SettingsLayout from '@/layouts/SettingsLayout.vue'
  import { Head } from '@inertiajs/vue3'
  import { useFetch } from '@vueuse/core'
  import { computed, ref } from 'vue'
  import type { SalesPerson } from '../../types'
  import { list } from '@/routes/salespeople'


  defineOptions({ layout: Layout })

  const { data: salespeople } = useFetch<SalesPerson[]>(list().url, { initialData: [] }).json<SalesPerson[]>()

  const q = ref('')

  const filteredSalespeople = computed(() => {
    return (
      salespeople.value?.filter((salesperson) => {
        return salesperson.name.search(new RegExp(q.value, 'i')) !== -1 || salesperson.nickname.search(new RegExp(q.value, 'i')) !== -1
      }) ?? []
    )
  })
</script>

<template>
  <SettingsLayout>
    <Head title="Salespeople List" />

    <UPageCard title="Salespeople List" variant="naked" orientation="horizontal" class="mb-4" />

    <UPageCard variant="subtle" :ui="{ container: 'p-0 sm:p-0 gap-y-0', wrapper: 'items-stretch', header: 'p-4 mb-0 border-b border-default' }">
      <template #header>
        <UInput 
        :search="true" v-model="q" icon="i-lucide-search" 
        trailing-icon="i-lucide-x" 
        :ui="{ trailing: { padding: 'p-0' } }"
        placeholder="Search salesperson" 
        autofocus class="w-full"  >
          <template #trailing>
            <UButton v-show="search" color="gray" size="xs" variant="link" icon="i-lucide-x" :padded="false"   class="cursor-pointer hover:bg-emerald-100 p-1 rounded-full"
              @click="q=''" />
          </template>
        </UInput>
      </template>

      <SettingsSalesPeopleList :salesPeople="filteredSalespeople" />
    </UPageCard>
  </SettingsLayout>
</template>
