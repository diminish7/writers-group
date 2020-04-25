<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <router-link to="/" class="navbar-brand mr-0">
        <i class="mdi mdi-typewriter" />
      </router-link>

      <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <router-link to="/" class="nav-link">
              {{ $t('site.title') }}
            </router-link>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <router-link to="/sign_in" class="nav-link">
              <i class="mdi mdi-login" />
              {{ $t('site.sign_in') }}
            </router-link>
          </li>
        </ul>
      </div>
    </nav>
    <slot/>
  </div>
</template>
